using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class gestiona_supervisor : Form
    {
        private const string PlaceholderText = "Buscar por ID, sucursal, nombre, usuario, correo, DUI, a cargo o estado...";
        private DataTable dtSupervisores;

        public gestiona_supervisor()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            CargarSupervisores();
        }

        private void ConfigurarTabla()
        {
            dgvSupervisores.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvSupervisores.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvSupervisores.MultiSelect = false;
            dgvSupervisores.ReadOnly = true;
            dgvSupervisores.AllowUserToAddRows = false;
            dgvSupervisores.RowHeadersVisible = false;
            dgvSupervisores.BackgroundColor = Color.White;
            dgvSupervisores.BorderStyle = BorderStyle.FixedSingle;

            dgvSupervisores.EnableHeadersVisualStyles = false;
            dgvSupervisores.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvSupervisores.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvSupervisores.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvSupervisores.ColumnHeadersHeight = 38;

            dgvSupervisores.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvSupervisores.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvSupervisores.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvSupervisores.RowTemplate.Height = 32;
        }

        // Llama a SP_CONSULTAR_SUPERVISOR(BUSQUEDA)
        private void CargarSupervisores()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_SUPERVISOR", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("BUSQUEDA", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtSupervisores = new DataTable();
                        da.Fill(dtSupervisores);

                        dgvSupervisores.DataSource = dtSupervisores;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cargar supervisores: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvSupervisores.Columns.Count == 0) return;

            dgvSupervisores.Columns["ID_EMPLEADO"].HeaderText = "ID";
            dgvSupervisores.Columns["ID_SUCURSAL"].HeaderText = "Sucursal";
            dgvSupervisores.Columns["NOMBRE_EMPLEADO"].HeaderText = "Nombre";
            dgvSupervisores.Columns["NOMBRE_USUARIO"].HeaderText = "Usuario";
            dgvSupervisores.Columns["CORREO_ELECTRONICO"].HeaderText = "Correo";
            dgvSupervisores.Columns["DUI_EMPLEADO"].HeaderText = "DUI";
            dgvSupervisores.Columns["FECHA_CONTRATACION"].HeaderText = "Contratación";
            dgvSupervisores.Columns["EMPLEADOS_A_CARGO"].HeaderText = "A Cargo";
            dgvSupervisores.Columns["ESTADO_USUARIO"].HeaderText = "Estado";

            dgvSupervisores.Columns["FECHA_CONTRATACION"].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvSupervisores.Columns["ID_EMPLEADO"].FillWeight = 45;
            dgvSupervisores.Columns["ID_SUCURSAL"].FillWeight = 55;
            dgvSupervisores.Columns["EMPLEADOS_A_CARGO"].FillWeight = 60;
        }

        // --- BOTÓN SUPERIOR ---
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            Registrar_Supervisor modalSupervisor = new Registrar_Supervisor();
            if (modalSupervisor.ShowDialog() == DialogResult.OK)
            {
                CargarSupervisores();
            }
        }

        // --- BOTONES DE CAMBIO DE ESTADO (INFERIORES) ---
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
            if (dgvSupervisores.SelectedRows.Count == 0)
            {
                MessageBox.Show($"Seleccione un supervisor para {accionTexto}.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string nombreUsuario = dgvSupervisores.SelectedRows[0].Cells["NOMBRE_USUARIO"].Value.ToString();
            string nombreEmpleado = dgvSupervisores.SelectedRows[0].Cells["NOMBRE_EMPLEADO"].Value.ToString();

            DialogResult resp = MessageBox.Show($"¿Está seguro que desea {accionTexto} al supervisor '{nombreEmpleado}' ({nombreUsuario})?",
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
                                            "ElectroHogar - Supervisores", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            CargarSupervisores();
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
            if (dtSupervisores == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtSupervisores.DefaultView.RowFilter = "";
                return;
            }

            dtSupervisores.DefaultView.RowFilter = string.Format(
                "CONVERT(ID_EMPLEADO, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(ID_SUCURSAL, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_EMPLEADO LIKE '%{0}%' OR " +
                "NOMBRE_USUARIO LIKE '%{0}%' OR " +
                "CORREO_ELECTRONICO LIKE '%{0}%' OR " +
                "DUI_EMPLEADO LIKE '%{0}%' OR " +
                "CONVERT(FECHA_CONTRATACION, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(EMPLEADOS_A_CARGO, 'System.String') LIKE '%{0}%' OR " +
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
