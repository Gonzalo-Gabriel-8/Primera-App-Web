using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Conexion;
using System.Data.SqlClient;

namespace Negocio
{
    public class TraineeNegocio
    {
        public void Actualizar(Trainee user)
        {
            Datos datos = new Datos();
            try
            {
                datos.SetearProcedimientoAlmacenado("ActualizarUser");
                datos.SetearParametros("@nombre", user.Nombre);
                datos.SetearParametros("@apellido", user.Apellido);
                datos.SetearParametros("@fechaNacimiento", user.FechaNacimiento);
                datos.SetearParametros("@imagen", (object)user.ImagenPerfil ?? DBNull.Value);
                datos.SetearParametros("@id", user.Id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public int InsertarNuevo(Trainee nuevo)
        {
            Datos datos = new Datos();
            try
            {
                datos.SetearProcedimientoAlmacenado("insertarNuevo");
                datos.SetearParametros("@pass", nuevo.Pass);
                datos.SetearParametros("@email", nuevo.Email);
                datos.SetearParametros("@nombre", nuevo.Nombre);
                datos.SetearParametros("@apellido", nuevo.Apellido);
                return datos.EjecutarAccionScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public bool Login(Trainee traine)
        {
            Datos datos = new Datos();
            try
            {
                datos.SetearConsulta("Select id, email, pass, admin, imagenPerfil from USERS Where email=@email AND  pass=@pass");
                datos.SetearParametros("@email", traine.Email);
                datos.SetearParametros("@pass", traine.Pass);
                datos.EjecutarLectura();
                if (datos.Lector.Read())
                {
                    traine.Id = (int)datos.Lector["id"];
                    traine.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["imagenPerfil"] is DBNull))
                        traine.ImagenPerfil = (string)datos.Lector["imagenPerfil"];
                    return true;
                }

                return false;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public List<Trainee> ListarConId(string id = "")
        {
            List<Trainee> lista = new List<Trainee>();
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;
            try
            {
                conexion.ConnectionString = "server=DESKTOP-A95RF6B; database=POKEDEXDB; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "select id, email, pass, nombre, apellido, fechaNacimiento, imagenPerfil from USERS ";
                if (id != "")
                {
                    comando.CommandText += " where Id= " + id;
                }
                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Trainee aux = new Trainee();
                    aux.Id = (int)lector["id"];
                    aux.Email = (string)lector["email"];
                    aux.Pass = (string)lector["pass"];
                    aux.Nombre = (string)lector["Nombre"];
                    aux.Apellido = (string)lector["apellido"];
                    if (!(lector["fechaNacimiento"] is DBNull))
                        aux.FechaNacimiento = (DateTime)lector["fechaNacimiento"];

                    if (!(lector["imagenPerfil"] is DBNull))
                        aux.ImagenPerfil = (string)lector["imagenPerfil"];


                    lista.Add(aux);
                }

                conexion.Close();
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
