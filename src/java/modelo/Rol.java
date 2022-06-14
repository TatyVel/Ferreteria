package modelo;

public class Rol {
    private int id_rol;
    private String nombre_rol;
    private String crear;
    private String actualizar;
    private String eliminar;

    public Rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getNombre_rol() {
        return nombre_rol;
    }

    public void setNombre_rol(String nombre_rol) {
        this.nombre_rol = nombre_rol;
    }

    public String getCrear() {
        return crear;
    }

    public void setCrear(String crear) {
        this.crear = crear;
    }

    public String getActualizar() {
        return actualizar;
    }

    public void setActualizar(String actualizar) {
        this.actualizar = actualizar;
    }

    public String getEliminar() {
        return eliminar;
    }

    public void setEliminar(String eliminar) {
        this.eliminar = eliminar;
    }
    
    
}
