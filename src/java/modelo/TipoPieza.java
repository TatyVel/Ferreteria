
package modelo;

public class TipoPieza {
    private int id_tipo;
    private String tipo_pieza;
    private String descripcion;

    public TipoPieza(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getTipo_pieza() {
        return tipo_pieza;
    }

    public void setTipo_pieza(String tipo_pieza) {
        this.tipo_pieza = tipo_pieza;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
