public class Widgets.Snippets : Gtk.Grid {
    construct {
        var headerbar = new Hdy.HeaderBar ();
        headerbar.decoration_layout = ":";
        headerbar.has_subtitle = false;
        headerbar.show_close_button = true;
        headerbar.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);

        var search_entry = new Gtk.SearchEntry ();

        var sidebar_label = new Gtk.Label ("Spinnets");
        sidebar_label.expand = true;

        var grid = new Gtk.Grid ();
        grid.expand = true;
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.add (headerbar);
        grid.add (search_entry);
        grid.add (sidebar_label);

        add (grid);
    }
}