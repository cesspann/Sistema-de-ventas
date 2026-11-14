using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class gestiona_vendedor : Form
    {
        private const string PlaceholderText = "Buscar por ID, nombre, usuario, correo, DUI, comisión o estado...";
        private DataTable dtVendedores;
        private int idSucursalActual;

        public gestiona_vendedor(int idSucursal = 0)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal > 0 ? idSucursal : (SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1);
            ConfigurarPlaceholder();
            ConfigurarTabla();
            CargarVendedores();
        }

        private void ConfigurarTabla()
        {
            dgvVendedores.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvVendedores.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvVendedores.MultiSelect = false;
            dgvVendedores.ReadOnly = true;
            dgvVendedores.AllowUserToAddRows = false;
            dgvVendedores.RowHeadersVisible = false;
            dgvVendedores.BackgroundColor = Color.White;
            dgvVendedores.BorderStyle = BorderStyle.FixedSingle;

            dgvVendedores.EnableHeadersVisualStyles = false;
            dgvVendedores.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvVendedores.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvVendedores.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvVendedores.ColumnHeadersHeight = 38;

            dgvVendedores.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvVendedores.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvVendedores.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvVendedores.RowTemplate.Height = 32;
        }

        // Llama a SP_CONSULTAR_VENDEDORES(P_ID_SUCURSAL, BUSQUEDA)
        private void CargarVendedores()
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_VENDEDORES", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", this.idSucursalActual);
                        cmd.Parameters.AddWithValue("BUSQUEDA", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtVendedores = new DataTable();
                        da.Fill(dtVendedores);

                        dgvVendedores.DataSource = dtVendedores;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cargar vendedores: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvVendedores.Columns.Count == 0) return;

            dgvVendedores.Columns["ID_EMPLEADO"].HeaderText = "ID";
            dgvVendedores.Columns["NOMBRE_EMPLEADO"].HeaderText = "Nombre";
            dgvVendedores.Columns["NOMBRE_USUARIO"].HeaderText = "Usuario";
            dgvVendedores.Columns["CORREO_ELECTRONICO"].HeaderText = "Correo";
            dgvVendedores.Columns["DUI_EMPLEADO"].HeaderText = "DUI";
            dgvVendedores.Columns["FECHA_CONTRATACION"].HeaderText = "Contratación";
            dgvVendedores.Columns["PORCENTAJE_COMISION"].HeaderText = "Comisión (%)";
            dgvVendedores.Columns["ESTADO_USUARIO"].HeaderText = "Estado";

            dgvVendedores.Columns["FECHA_CONTRATACION"].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvVendedores.Columns["PORCENTAJE_COMISION"].DefaultCellStyle.Format = "N2";
            dgvVendedores.Columns["ID_EMPLEADO"].FillWeight = 45;
            dgvVendedores.Columns["PORCENTAJE_COMISION"].FillWeight = 65;
        }

        // --- BOTÓN SUPERIOR ---
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            Registrar_Vendedor modalVendedor = new Registrar_Vendedor();
            if (modalVendedor.ShowDialog() == DialogResult.OK)
            {
                CargarVendedores();
            }
        }

        // --- BOTONES INFERIORES (ACCIONES SOBRE VENDEDOR SELECCIONADO) ---
        private void btnActualizar_Click(object sender, EventArgs e)
        {
            if (dgvVendedores.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un vendedor de la tabla para actualizar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idEmpleado = Convert.ToInt32(dgvVendedores.SelectedRows[0].Cells["ID_EMPLEADO"].Value);
            string nombre = dgvVendedores.SelectedRows[0].Cells["NOMBRE_EMPLEADO"].Value.ToString();
            decimal comision = Convert.ToDecimal(dgvVendedores.SelectedRows[0].Cells["PORCENTAJE_COMISION"].Value);


            ActualizarVendedor modalActualizar = new ActualizarVendedor(idEmpleado, nombre, comision, 0);
            if (modalActualizar.ShowDialog() == DialogResult.OK)
            {
                CargarVendedores();
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
            if (dgvVendedores.SelectedRows.Count == 0)
            {
                MessageBox.Show($"Seleccione un vendedor para {accionTexto}.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string nombreUsuario = dgvVendedores.SelectedRows[0].Cells["NOMBRE_USUARIO"].Value.ToString();
            string nombreEmpleado = dgvVendedores.SelectedRows[0].Cells["NOMBRE_EMPLEADO"].Value.ToString();


            DialogResult resp = MessageBox.Show($"¿Está seguro que desea {accionTexto} al vendedor '{nombreEmpleado}' ({nombreUsuario})?",
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
                                            "ElectroHogar - Vendedores", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            CargarVendedores();
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
            if (dtVendedores == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {

                dtVendedores.DefaultView.RowFilter = "";
                return;
            }
            dtVendedores.DefaultView.RowFilter = string.Format(
            "CONVERT(ID_EMPLEADO, 'System.String') LIKE '%{0}%' OR " +
            "NOMBRE_EMPLEADO LIKE '%{0}%' OR " +
            "NOMBRE_USUARIO LIKE '%{0}%' OR " +
            "CORREO_ELECTRONICO LIKE '%{0}%' OR " +
            "DUI_EMPLEADO LIKE '%{0}%' OR " +
            "CONVERT(FECHA_CONTRATACION, 'System.String') LIKE '%{0}%' OR " +
            "CONVERT(PORCENTAJE_COMISION, 'System.String') LIKE '%{0}%' OR " +
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