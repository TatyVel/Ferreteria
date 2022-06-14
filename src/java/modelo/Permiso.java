package modelo;

public class Permiso {
    
    private int id_rol_menu;
    private Rol id_rol;
    private Menu id_menu;

    public Permiso(int id_rol_menu) {
        this.id_rol_menu = id_rol_menu;
    }

    public int getId_rol_menu() {
        return id_rol_menu;
    }

    public void setId_rol_menu(int id_rol_menu) {
        this.id_rol_menu = id_rol_menu;
    }

    public Rol getId_rol() {
        return id_rol;
    }

    public void setId_rol(Rol id_rol) {
        this.id_rol = id_rol;
    }

    public Menu getId_menu() {
        return id_menu;
    }

    public void setId_menu(Menu id_menu) {
        this.id_menu = id_menu;
    }
    
    
    
}
