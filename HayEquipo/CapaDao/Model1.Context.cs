﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaEntidades
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class HayEquipoEntities : DbContext
    {
        public HayEquipoEntities()
            : base("name=HayEquipoEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Administrador> Administrador { get; set; }
        public virtual DbSet<AmigosPorDeportistas> AmigosPorDeportistas { get; set; }
        public virtual DbSet<Barrio> Barrio { get; set; }
        public virtual DbSet<Cancha> Cancha { get; set; }
        public virtual DbSet<CanchasPorHorarios> CanchasPorHorarios { get; set; }
        public virtual DbSet<ComplejoDeportivo> ComplejoDeportivo { get; set; }
        public virtual DbSet<Deporte> Deporte { get; set; }
        public virtual DbSet<DeportesPorDeportistas> DeportesPorDeportistas { get; set; }
        public virtual DbSet<Deportista> Deportista { get; set; }
        public virtual DbSet<DeportistasPorEquipos> DeportistasPorEquipos { get; set; }
        public virtual DbSet<EncuentroDeportivo> EncuentroDeportivo { get; set; }
        public virtual DbSet<Equipo> Equipo { get; set; }
        public virtual DbSet<Estado> Estado { get; set; }
        public virtual DbSet<Horario> Horario { get; set; }
        public virtual DbSet<InvitacionEncuentro> InvitacionEncuentro { get; set; }
        public virtual DbSet<Localidad> Localidad { get; set; }
        public virtual DbSet<Mensaje> Mensaje { get; set; }
        public virtual DbSet<Pais> Pais { get; set; }
        public virtual DbSet<Permiso> Permiso { get; set; }
        public virtual DbSet<PermisosPorRoles> PermisosPorRoles { get; set; }
        public virtual DbSet<Posicion> Posicion { get; set; }
        public virtual DbSet<PosicionesPorDeportistas> PosicionesPorDeportistas { get; set; }
        public virtual DbSet<Provincia> Provincia { get; set; }
        public virtual DbSet<Publicacion> Publicacion { get; set; }
        public virtual DbSet<ReseñaComplejo> ReseñaComplejo { get; set; }
        public virtual DbSet<Responsable> Responsable { get; set; }
        public virtual DbSet<Rol> Rol { get; set; }
        public virtual DbSet<RolesPorUsuarios> RolesPorUsuarios { get; set; }
        public virtual DbSet<Rubro> Rubro { get; set; }
        public virtual DbSet<ServicioExtra> ServicioExtra { get; set; }
        public virtual DbSet<ServiciosPorComplejos> ServiciosPorComplejos { get; set; }
        public virtual DbSet<Sesion> Sesion { get; set; }
        public virtual DbSet<Sponsor> Sponsor { get; set; }
        public virtual DbSet<TipoCancha> TipoCancha { get; set; }
        public virtual DbSet<TipoDeporte> TipoDeporte { get; set; }
        public virtual DbSet<TipoDocumento> TipoDocumento { get; set; }
        public virtual DbSet<TiposPorDeportes> TiposPorDeportes { get; set; }
        public virtual DbSet<TipoValoracion> TipoValoracion { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<Valoracion> Valoracion { get; set; }
        public virtual DbSet<Zona> Zona { get; set; }
        public virtual DbSet<ZonasPorDeportistas> ZonasPorDeportistas { get; set; }
        public virtual DbSet<FotosComplejo> FotosComplejo { get; set; }
        public virtual DbSet<FotosDeportista> FotosDeportista { get; set; }
        public virtual DbSet<Notificacion> Notificacion { get; set; }
        public virtual DbSet<Reserva> Reserva { get; set; }
        public virtual DbSet<UsuariosPorEncuentroDeportivo> UsuariosPorEncuentroDeportivo { get; set; }
    
        public virtual ObjectResult<sp_AgendaDao_ObtenerAgendaComplejo_Result> sp_AgendaDao_ObtenerAgendaComplejo(Nullable<int> idComplejo, Nullable<int> idDeporte)
        {
            var idComplejoParameter = idComplejo.HasValue ?
                new ObjectParameter("idComplejo", idComplejo) :
                new ObjectParameter("idComplejo", typeof(int));
    
            var idDeporteParameter = idDeporte.HasValue ?
                new ObjectParameter("idDeporte", idDeporte) :
                new ObjectParameter("idDeporte", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_AgendaDao_ObtenerAgendaComplejo_Result>("sp_AgendaDao_ObtenerAgendaComplejo", idComplejoParameter, idDeporteParameter);
        }
    
        public virtual ObjectResult<sp_AgendaDao_ObtenerHorariosReservados_Result> sp_AgendaDao_ObtenerHorariosReservados(Nullable<int> idComplejo, Nullable<System.DateTime> fecha)
        {
            var idComplejoParameter = idComplejo.HasValue ?
                new ObjectParameter("idComplejo", idComplejo) :
                new ObjectParameter("idComplejo", typeof(int));
    
            var fechaParameter = fecha.HasValue ?
                new ObjectParameter("fecha", fecha) :
                new ObjectParameter("fecha", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_AgendaDao_ObtenerHorariosReservados_Result>("sp_AgendaDao_ObtenerHorariosReservados", idComplejoParameter, fechaParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> sp_EncuentroDeportivoDao_idEncuentroCreado(Nullable<int> usuario)
        {
            var usuarioParameter = usuario.HasValue ?
                new ObjectParameter("usuario", usuario) :
                new ObjectParameter("usuario", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("sp_EncuentroDeportivoDao_idEncuentroCreado", usuarioParameter);
        }
    
        public virtual int sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentro(Nullable<int> idUsuario, Nullable<int> idEncuentro)
        {
            var idUsuarioParameter = idUsuario.HasValue ?
                new ObjectParameter("idUsuario", idUsuario) :
                new ObjectParameter("idUsuario", typeof(int));
    
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentro", idUsuarioParameter, idEncuentroParameter);
        }
    
        public virtual int sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoA(Nullable<int> idUsuario, Nullable<int> idEncuentro)
        {
            var idUsuarioParameter = idUsuario.HasValue ?
                new ObjectParameter("idUsuario", idUsuario) :
                new ObjectParameter("idUsuario", typeof(int));
    
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoA", idUsuarioParameter, idEncuentroParameter);
        }
    
        public virtual int sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoB(Nullable<int> idUsuario, Nullable<int> idEncuentro)
        {
            var idUsuarioParameter = idUsuario.HasValue ?
                new ObjectParameter("idUsuario", idUsuario) :
                new ObjectParameter("idUsuario", typeof(int));
    
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoB", idUsuarioParameter, idEncuentroParameter);
        }
    
        public virtual ObjectResult<sp_EncuentroDeportivoDao_insertarUsuarioPrivado_Result> sp_EncuentroDeportivoDao_insertarUsuarioPrivado(Nullable<int> idEnc)
        {
            var idEncParameter = idEnc.HasValue ?
                new ObjectParameter("idEnc", idEnc) :
                new ObjectParameter("idEnc", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_EncuentroDeportivoDao_insertarUsuarioPrivado_Result>("sp_EncuentroDeportivoDao_insertarUsuarioPrivado", idEncParameter);
        }
    
        public virtual int sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoA(Nullable<int> idUsuario, Nullable<int> idEncuentro)
        {
            var idUsuarioParameter = idUsuario.HasValue ?
                new ObjectParameter("idUsuario", idUsuario) :
                new ObjectParameter("idUsuario", typeof(int));
    
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoA", idUsuarioParameter, idEncuentroParameter);
        }
    
        public virtual int sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoB(Nullable<int> idUsuario, Nullable<int> idEncuentro)
        {
            var idUsuarioParameter = idUsuario.HasValue ?
                new ObjectParameter("idUsuario", idUsuario) :
                new ObjectParameter("idUsuario", typeof(int));
    
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoB", idUsuarioParameter, idEncuentroParameter);
        }
    
        public virtual ObjectResult<sp_EncuentroDeportivoQUeryDao_BuscarEncuentroPrivado_Result> sp_EncuentroDeportivoQUeryDao_BuscarEncuentroPrivado(Nullable<int> idEnc)
        {
            var idEncParameter = idEnc.HasValue ?
                new ObjectParameter("idEnc", idEnc) :
                new ObjectParameter("idEnc", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_EncuentroDeportivoQUeryDao_BuscarEncuentroPrivado_Result>("sp_EncuentroDeportivoQUeryDao_BuscarEncuentroPrivado", idEncParameter);
        }
    
        public virtual ObjectResult<sp_EncuentroDeportivoQueryDao_BuscarEncuentroPublico_Result> sp_EncuentroDeportivoQueryDao_BuscarEncuentroPublico(Nullable<int> idEnc)
        {
            var idEncParameter = idEnc.HasValue ?
                new ObjectParameter("idEnc", idEnc) :
                new ObjectParameter("idEnc", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_EncuentroDeportivoQueryDao_BuscarEncuentroPublico_Result>("sp_EncuentroDeportivoQueryDao_BuscarEncuentroPublico", idEncParameter);
        }
    
        public virtual int sp_MensajeDao_InsertarMensaje(Nullable<int> idEncuentro, Nullable<System.DateTime> fechaHora, string texto, Nullable<int> idUsuario)
        {
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            var fechaHoraParameter = fechaHora.HasValue ?
                new ObjectParameter("fechaHora", fechaHora) :
                new ObjectParameter("fechaHora", typeof(System.DateTime));
    
            var textoParameter = texto != null ?
                new ObjectParameter("texto", texto) :
                new ObjectParameter("texto", typeof(string));
    
            var idUsuarioParameter = idUsuario.HasValue ?
                new ObjectParameter("idUsuario", idUsuario) :
                new ObjectParameter("idUsuario", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_MensajeDao_InsertarMensaje", idEncuentroParameter, fechaHoraParameter, textoParameter, idUsuarioParameter);
        }
    
        public virtual ObjectResult<sp_MensajeQueryDao_MostrarMensajes_Result> sp_MensajeQueryDao_MostrarMensajes(Nullable<int> idEncuentro)
        {
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_MensajeQueryDao_MostrarMensajes_Result>("sp_MensajeQueryDao_MostrarMensajes", idEncuentroParameter);
        }
    
        public virtual int sp_NotificacionDao_insertarNotificacion(Nullable<int> idEmisor, Nullable<int> idEncuentro, string texto)
        {
            var idEmisorParameter = idEmisor.HasValue ?
                new ObjectParameter("idEmisor", idEmisor) :
                new ObjectParameter("idEmisor", typeof(int));
    
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            var textoParameter = texto != null ?
                new ObjectParameter("texto", texto) :
                new ObjectParameter("texto", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_NotificacionDao_insertarNotificacion", idEmisorParameter, idEncuentroParameter, textoParameter);
        }
    
        public virtual ObjectResult<string> sp_PermisoUsuario(string usuario)
        {
            var usuarioParameter = usuario != null ?
                new ObjectParameter("usuario", usuario) :
                new ObjectParameter("usuario", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_PermisoUsuario", usuarioParameter);
        }
    
        public virtual int sp_ReservaDao_InsertarRerserva(Nullable<System.DateTime> fecha, Nullable<int> idEncuentro, Nullable<int> idEstado)
        {
            var fechaParameter = fecha.HasValue ?
                new ObjectParameter("fecha", fecha) :
                new ObjectParameter("fecha", typeof(System.DateTime));
    
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            var idEstadoParameter = idEstado.HasValue ?
                new ObjectParameter("idEstado", idEstado) :
                new ObjectParameter("idEstado", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_ReservaDao_InsertarRerserva", fechaParameter, idEncuentroParameter, idEstadoParameter);
        }
    
        public virtual ObjectResult<sp_UsuarioDao_ObtenerUsuarios_Result> sp_UsuarioDao_ObtenerUsuarios(Nullable<int> idUsuario)
        {
            var idUsuarioParameter = idUsuario.HasValue ?
                new ObjectParameter("idUsuario", idUsuario) :
                new ObjectParameter("idUsuario", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_UsuarioDao_ObtenerUsuarios_Result>("sp_UsuarioDao_ObtenerUsuarios", idUsuarioParameter);
        }
    
        public virtual ObjectResult<string> sp_UsuarioDao_UsuariosUnidosEncuentro(Nullable<int> idEncuentro)
        {
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_UsuarioDao_UsuariosUnidosEncuentro", idEncuentroParameter);
        }
    
        public virtual ObjectResult<sp_UsuarioDao_UsuariosUnidosEncuentroEquipoA_Result> sp_UsuarioDao_UsuariosUnidosEncuentroEquipoA(Nullable<int> idEncuentro)
        {
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_UsuarioDao_UsuariosUnidosEncuentroEquipoA_Result>("sp_UsuarioDao_UsuariosUnidosEncuentroEquipoA", idEncuentroParameter);
        }
    
        public virtual ObjectResult<sp_UsuarioDao_UsuariosUnidosEncuentroEquipoB_Result> sp_UsuarioDao_UsuariosUnidosEncuentroEquipoB(Nullable<int> idEncuentro)
        {
            var idEncuentroParameter = idEncuentro.HasValue ?
                new ObjectParameter("idEncuentro", idEncuentro) :
                new ObjectParameter("idEncuentro", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_UsuarioDao_UsuariosUnidosEncuentroEquipoB_Result>("sp_UsuarioDao_UsuariosUnidosEncuentroEquipoB", idEncuentroParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> sp_UsuarioID(string usuario)
        {
            var usuarioParameter = usuario != null ?
                new ObjectParameter("usuario", usuario) :
                new ObjectParameter("usuario", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("sp_UsuarioID", usuarioParameter);
        }
    
        public virtual int spInsertarImagen()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spInsertarImagen");
        }
    
        public virtual ObjectResult<spObtenerCanchasPorComplejos_Result> spObtenerCanchasPorComplejos(Nullable<int> idComp)
        {
            var idCompParameter = idComp.HasValue ?
                new ObjectParameter("idComp", idComp) :
                new ObjectParameter("idComp", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spObtenerCanchasPorComplejos_Result>("spObtenerCanchasPorComplejos", idCompParameter);
        }
    
        public virtual ObjectResult<spObtenerComplejosJoin_Result> spObtenerComplejosJoin()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spObtenerComplejosJoin_Result>("spObtenerComplejosJoin");
        }
    
        public virtual ObjectResult<spObtenerComplejosOrdenValor_Result> spObtenerComplejosOrdenValor()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spObtenerComplejosOrdenValor_Result>("spObtenerComplejosOrdenValor");
        }
    
        public virtual ObjectResult<spObtenerComplejosPorNomb_Result> spObtenerComplejosPorNomb(string nomb)
        {
            var nombParameter = nomb != null ?
                new ObjectParameter("nomb", nomb) :
                new ObjectParameter("nomb", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spObtenerComplejosPorNomb_Result>("spObtenerComplejosPorNomb", nombParameter);
        }
    
        public virtual ObjectResult<spObtenerServiciosPorComplejos_Result> spObtenerServiciosPorComplejos(Nullable<int> idComp)
        {
            var idCompParameter = idComp.HasValue ?
                new ObjectParameter("idComp", idComp) :
                new ObjectParameter("idComp", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spObtenerServiciosPorComplejos_Result>("spObtenerServiciosPorComplejos", idCompParameter);
        }
    
        public virtual int spRegistrarUsuario(string prmNombre, string prmEmail, string prmContraseña)
        {
            var prmNombreParameter = prmNombre != null ?
                new ObjectParameter("prmNombre", prmNombre) :
                new ObjectParameter("prmNombre", typeof(string));
    
            var prmEmailParameter = prmEmail != null ?
                new ObjectParameter("prmEmail", prmEmail) :
                new ObjectParameter("prmEmail", typeof(string));
    
            var prmContraseñaParameter = prmContraseña != null ?
                new ObjectParameter("prmContraseña", prmContraseña) :
                new ObjectParameter("prmContraseña", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spRegistrarUsuario", prmNombreParameter, prmEmailParameter, prmContraseñaParameter);
        }
    
        public virtual int spRegistrarUsuarioEstablecimiento(string prmNombre, string prmEmail, string prmContraseña)
        {
            var prmNombreParameter = prmNombre != null ?
                new ObjectParameter("prmNombre", prmNombre) :
                new ObjectParameter("prmNombre", typeof(string));
    
            var prmEmailParameter = prmEmail != null ?
                new ObjectParameter("prmEmail", prmEmail) :
                new ObjectParameter("prmEmail", typeof(string));
    
            var prmContraseñaParameter = prmContraseña != null ?
                new ObjectParameter("prmContraseña", prmContraseña) :
                new ObjectParameter("prmContraseña", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spRegistrarUsuarioEstablecimiento", prmNombreParameter, prmEmailParameter, prmContraseñaParameter);
        }
    }
}
