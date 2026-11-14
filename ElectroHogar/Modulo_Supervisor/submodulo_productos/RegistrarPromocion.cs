using System;
using System.Collections.Generic;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class RegistrarPromocion : Form
    {
        private int idEmpleadoActual;

        private class ItemProducto
        {
            public int IdProducto { get; set; }
            public string Texto { get; set; }
            public override string ToString() => Texto;
        }

        public RegistrarPromocion()
        {
            InitializeComponent();
            this.idEmpleadoActual = SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1;
            ConfigurarFechas();
            CargarProductosEnLista();
        }

        private void ConfigurarFechas()
        {
            dtpFechaInicio.Format = DateTimePickerFormat.Short;
            dtpFechaFin.Format = DateTimePickerFormat.Short;
        }

        private void CargarProductosEnLista()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_PRODUCTOS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoActual);
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", DBNull.Value);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            clbProductos.Items.Clear();
                            while (reader.Read())
                            {
                                string estado = reader["ESTADO_PRODUCTO"].ToString();
                                if (estado.Equals("Activo", StringComparison.OrdinalIgnoreCase))
                                {
                                    int idProd = Convert.ToInt32(reader["ID_PRODUCTO"]);
                                    string nombre = reader["NOMBRE_PRODUCTO"].ToString();
                                    decimal precio = Convert.ToDecimal(reader["PRECIO_VENTA"]);

                                    clbProductos.Items.Add(new ItemProducto
                                    {
                                        IdProducto = idProd,
                                        Texto = $"[{idProd}] {nombre} ({precio:C2})"
                                    });
                                }
                            }
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cargar productos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            DateTime fechaInicio = dtpFechaInicio.Value.Date;
            DateTime fechaFin = dtpFechaFin.Value.Date;
            decimal porcentaje = numPorcentaje.Value;

            if (fechaFin < fechaInicio)
            {
                MessageBox.Show("La fecha de finalización no puede ser anterior a la fecha de inicio.",
                                "Validación de Fechas", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                dtpFechaFin.Focus();
                return;
            }

            if (porcentaje <= 0 || porcentaje > 100)
            {
                MessageBox.Show("El porcentaje de descuento debe estar entre 0 y 100.",
                                "Validación de Descuento", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numPorcentaje.Focus();
                return;
            }

            if (clbProductos.CheckedItems.Count == 0)
            {
                MessageBox.Show("Debe seleccionar al menos un producto para aplicar la promoción.",
                                "Selección Requerida", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                clbProductos.Focus();
                return;
            }

            List<int> idsSeleccionados = new List<int>();
            foreach (object item in clbProductos.CheckedItems)
            {
                if (item is ItemProducto prod)
                {
                    idsSeleccionados.Add(prod.IdProducto);
                }
            }
            string jsonProductos = "[" + string.Join(",", idsSeleccionados) + "]";

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRAR_PROMOCION", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_FECHA_INICIO", fechaInicio);
                        cmd.Parameters.AddWithValue("P_FECHA_FIN", fechaFin);
                        cmd.Parameters.AddWithValue("P_PORCENTAJE_DESCUENTO", porcentaje);
                        cmd.Parameters.AddWithValue("P_PRODUCTOS", jsonProductos);

                        MySqlParameter paramId = new MySqlParameter("P_ID_PROMOCION", MySqlDbType.Int32);
                        paramId.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramId);

                        cmd.ExecuteNonQuery();
                        int idPromocion = Convert.ToInt32(paramId.Value);

                        MessageBox.Show($"Promoción #{idPromocion} ({porcentaje:N2}%) registrada y aplicada a {idsSeleccionados.Count} producto(s).",
                                        "ElectroHogar - Promociones", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        this.DialogResult = DialogResult.OK;
                        this.Close();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
