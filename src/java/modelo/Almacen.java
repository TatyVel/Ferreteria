
package modelo;

public class Almacen {
    private int id_almacen;
    private int num_almacen;
    private String descripcion;
    private String direccion;
    private String nombre_estanteria;

    public Almacen(int id_almacen) {
        this.id_almacen = id_almacen;
    }

    public int getId_almacen() {
        return id_almacen;
    }

    public void setId_almacen(int id_almacen) {
        this.id_almacen = id_almacen;
    }

    public int getNum_almacen() {
        return num_almacen;
    }

    public void setNum_almacen(int num_almacen) {
        this.num_almacen = num_almacen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNombre_estanteria() {
        return nombre_estanteria;
    }

    public void setNombre_estanteria(String nombre_estanteria) {
        this.nombre_estanteria = nombre_estanteria;
    }
    
    
    
}
