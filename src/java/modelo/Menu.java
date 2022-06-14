package modelo;

public class Menu {
    private int id_menu;
    private String nombre_modulo;
    private String url;
    private int tipo;

    public Menu(int id_menu) {
        this.id_menu = id_menu;
    }

    public int getId_menu() {
        return id_menu;
    }

    public void setId_menu(int id_menu) {
        this.id_menu = id_menu;
    }

    public String getNombre_modulo() {
        return nombre_modulo;
    }

    public void setNombre_modulo(String nombre_modulo) {
        this.nombre_modulo = nombre_modulo;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
    
    
}
