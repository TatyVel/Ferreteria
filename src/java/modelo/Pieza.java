package modelo;

public class Pieza {
    
    private int id_pieza;
    private String tipo_pieza;
    private int modelo;
    private double precio;
    private String descripcion;
    private int cantidad;
    private TipoPieza id_tipo;

    public Pieza(int id_pieza) {
        this.id_pieza = id_pieza;
    }

    public int getId_pieza() {
        return id_pieza;
    }

    public void setId_pieza(int id_pieza) {
        this.id_pieza = id_pieza;
    }

    public String getTipo_pieza() {
        return tipo_pieza;
    }

    public void setTipo_pieza(String tipo_pieza) {
        this.tipo_pieza = tipo_pieza;
    }

    public int getModelo() {
        return modelo;
    }

    public void setModelo(int modelo) {
        this.modelo = modelo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public TipoPieza getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(TipoPieza id_tipo) {
        this.id_tipo = id_tipo;
    }
    
    
}
