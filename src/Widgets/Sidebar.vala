public class Widgets.Sidebar : Gtk.EventBox {
    construct {
        var sidebar_header = new Hdy.HeaderBar ();
        sidebar_header.decoration_layout = "close:";
        sidebar_header.has_subtitle = false;
        sidebar_header.show_close_button = true;
        // sidebar_header.get_style_context ().add_class ("sidebar-header");
        sidebar_header.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);

        var sidebar_label = new Gtk.Label ("Sidebar");
        sidebar_label.expand = true;

        var grid = new Gtk.Grid ();
        grid.expand = true;
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.add (sidebar_header);
        grid.add (sidebar_label);

        add (grid);
    }
}