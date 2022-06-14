package modelo;

public class Movimiento {
    private int id_movimientos;
    private Almacen id_almacen;
    private Pieza id_pieza;
    private Usuario id_usuario;

    public Movimiento(int id_movimientos) {
        this.id_movimientos = id_movimientos;
    }

    public int getId_movimientos() {
        return id_movimientos;
    }

    public void setId_movimientos(int id_movimientos) {
        this.id_movimientos = id_movimientos;
    }

    public Almacen getId_almacen() {
        return id_almacen;
    }

    public void setId_almacen(Almacen id_almacen) {
        this.id_almacen = id_almacen;
    }

    public Pieza getId_pieza() {
        return id_pieza;
    }

    public void setId_pieza(Pieza id_pieza) {
        this.id_pieza = id_pieza;
    }

    public Usuario getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Usuario id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    

    
    
    
}
