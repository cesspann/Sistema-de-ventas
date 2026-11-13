using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class GestionCajerosSupervisor : Form
    {
        private const string PlaceholderText = "Buscar por ID, nombre, usuario, correo, DUI, caja, turno o estado...";
        private DataTable dtCajeros;
        private int idSucursalActual;

        public GestionCajerosSupervisor()
        {
            InitializeComponent();
            this.idSucursalActual = SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1;
            ConfigurarPlaceholder();
            ConfigurarTabla();
            CargarCajeros();
        }

        private void ConfigurarTabla()
        {
            dgvCajeros.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvCajeros.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvCajeros.MultiSelect = false;
            dgvCajeros.ReadOnly = true;
            dgvCajeros.AllowUserToAddRows = false;
            dgvCajeros.RowHeadersVisible = false;
            dgvCajeros.BackgroundColor = Color.White;
            dgvCajeros.BorderStyle = BorderStyle.FixedSingle;

            dgvCajeros.EnableHeadersVisualStyles = false;
            dgvCajeros.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvCajeros.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvCajeros.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvCajeros.ColumnHeadersHeight = 38;

            dgvCajeros.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvCajeros.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvCajeros.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvCajeros.RowTemplate.Height = 32;
        }

        private void CargarCajeros()
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_CAJEROS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", this.idSucursalActual);
                        cmd.Parameters.AddWithValue("BUSQUEDA", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtCajeros = new DataTable();
                        da.Fill(dtCajeros);

                        dgvCajeros.DataSource = dtCajeros;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cargar cajeros: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvCajeros.Columns.Count == 0) return;

            dgvCajeros.Columns["ID_EMPLEADO"].HeaderText = "ID";
            dgvCajeros.Columns["NOMBRE_EMPLEADO"].HeaderText = "Nombre";
            dgvCajeros.Columns["NOMBRE_USUARIO"].HeaderText = "Usuario";
            dgvCajeros.Columns["CORREO_ELECTRONICO"].HeaderText = "Correo";
            dgvCajeros.Columns["DUI_EMPLEADO"].HeaderText = "DUI";
            dgvCajeros.Columns["FECHA_CONTRATACION"].HeaderText = "Contratación";
            dgvCajeros.Columns["NUMERO_CAJA"].HeaderText = "Caja";
            dgvCajeros.Columns["TURNO"].HeaderText = "Turno";
            dgvCajeros.Columns["ESTADO_USUARIO"].HeaderText = "Estado";

            dgvCajeros.Columns["FECHA_CONTRATACION"].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvCajeros.Columns["ID_EMPLEADO"].FillWeight = 45;
            dgvCajeros.Columns["NUMERO_CAJA"].FillWeight = 50;
        }

        // --- BOTÓN SUPERIOR: AGREGAR ---
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            Registrar_Cajero modalCajero = new Registrar_Cajero();
            if (modalCajero.ShowDialog() == DialogResult.OK)
            {
                CargarCajeros();
            }
        }

        // --- BOTONES INFERIORES: ACTUALIZAR Y CAMBIAR ESTADO ---
        private void btnActualizar_Click(object sender, EventArgs e)
        {
            if (dgvCajeros.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un cajero de la tabla para actualizar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idEmpleado = Convert.ToInt32(dgvCajeros.SelectedRows[0].Cells["ID_EMPLEADO"].Value);
            string nombre = dgvCajeros.SelectedRows[0].Cells["NOMBRE_EMPLEADO"].Value.ToString();
            int caja = Convert.ToInt32(dgvCajeros.SelectedRows[0].Cells["NUMERO_CAJA"].Value);
            string turno = dgvCajeros.SelectedRows[0].Cells["TURNO"].Value.ToString();

            ActualizarCajero modalActualizar = new ActualizarCajero(idEmpleado, nombre, caja, turno);
            if (modalActualizar.ShowDialog() == DialogResult.OK)
            {
                CargarCajeros();
            }
        }

        private void btnActivar_Click(object sender, EventArgs e)
        {
            EjecutarCambioEstadoUsuario("SP_REACTIVAR_USUARIO", "activar");
        }

        private void btnDesactivar_Click(object sender, EventArgs e)
        {
            EjecutarCambioEstadoUsuario("SP_DESACTIVAR_USUARIO", "desactivar");
        }

        private void btnDesbloquear_Click(object sender, EventArgs e)
        {
            EjecutarCambioEstadoUsuario("SP_DESBLOQUEAR_USUARIO", "desbloquear");
        }

        private void EjecutarCambioEstadoUsuario(string nombreSp, string accionTexto)
        {
            if (dgvCajeros.SelectedRows.Count == 0)
            {
                MessageBox.Show($"Seleccione un cajero de la tabla para {accionTexto}.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string nombreUsuario = dgvCajeros.SelectedRows[0].Cells["NOMBRE_USUARIO"].Value.ToString();
            string nombreEmpleado = dgvCajeros.SelectedRows[0].Cells["NOMBRE_EMPLEADO"].Value.ToString();

            DialogResult resp = MessageBox.Show($"¿Está seguro que desea {accionTexto} al cajero '{nombreEmpleado}' ({nombreUsuario})?",
                                                "Confirmar Acción", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (resp != DialogResult.Yes) return;

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(nombreSp, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_NOMBRE_USUARIO", nombreUsuario);

                        MySqlParameter paramConf = new MySqlParameter("CONFIRMACION", MySqlDbType.Int32);
                        paramConf.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramConf);

                        cmd.ExecuteNonQuery();
                        int confirmacion = Convert.ToInt32(paramConf.Value);

                        if (confirmacion == 1)
                        {
                            MessageBox.Show($"Usuario '{nombreUsuario}' actualizado correctamente.",
                                            "ElectroHogar - Cajeros", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            CargarCajeros();
                        }
                        else if (confirmacion == -2)
                        {
                            MessageBox.Show("El nombre de usuario no puede estar vacío.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else if (confirmacion == -3)
                        {
                            MessageBox.Show("El usuario no existe en la base de datos.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else
                        {
                            MessageBox.Show("Ocurrió un error interno en el servidor.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error de base de datos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        // --- BÚSQUEDA DINÁMICA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltroLocal();
        }

        private void AplicarFiltroLocal()
        {
            if (dtCajeros == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtCajeros.DefaultView.RowFilter = "";
                return;
            }

            dtCajeros.DefaultView.RowFilter = string.Format(
                "CONVERT(ID_EMPLEADO, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_EMPLEADO LIKE '%{0}%' OR " +
                "NOMBRE_USUARIO LIKE '%{0}%' OR " +
                "CORREO_ELECTRONICO LIKE '%{0}%' OR " +

                "DUI_EMPLEADO LIKE '%{0}%' OR " +
"CONVERT(FECHA_CONTRATACION, 'System.String') LIKE '%{0}%' OR " +
"CONVERT(NUMERO_CAJA, 'System.String') LIKE '%{0}%' OR " +
"TURNO LIKE '%{0}%' OR " +
"ESTADO_USUARIO LIKE '%{0}%'",
filtro
);
        }
        private void ConfigurarPlaceholder()
        {
            txtBuscar.Text = PlaceholderText;
            txtBuscar.ForeColor = Color.Gray;
            txtBuscar.Enter += (s, e) =>
            {
                if (txtBuscar.Text == PlaceholderText)
                {
                    txtBuscar.Text = "";
                    txtBuscar.ForeColor = Color.Black;
                }
            };
            txtBuscar.Leave += (s, e) =>
            {
                if (string.IsNullOrWhiteSpace(txtBuscar.Text))
                {
                    txtBuscar.Text = PlaceholderText;
                    txtBuscar.ForeColor = Color.Gray;
                }
            };
        }
        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}