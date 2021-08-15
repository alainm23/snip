public class Widgets.Snippets : Gtk.Grid {
    construct {
        var headerbar = new Hdy.HeaderBar ();
        headerbar.decoration_layout = ":";
        headerbar.has_subtitle = false;
        headerbar.show_close_button = true;
        headerbar.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);

        var search_entry = new Gtk.SearchEntry ();
        search_entry.placeholder_text = _("Search snippets");
        search_entry.margin = 3;
        search_entry.hexpand = true;

        var add_image = new Gtk.Image ();
        add_image.gicon = new ThemedIcon ("list-add-symbolic");
        add_image.pixel_size = 16;

        var add_button = new Gtk.Button ();
        add_button.margin_end = 3;
        add_button.margin_start = 3;
        add_button.valign = Gtk.Align.CENTER;
        add_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);
        add_button.add (add_image);

        var header_grid = new Gtk.Grid ();
        header_grid.add (search_entry);
        header_grid.add (add_button);

        headerbar.custom_title = header_grid;

        var sidebar_label = new Gtk.Label ("Spinnets");
        sidebar_label.expand = true;

        var main_grid = new Gtk.Grid ();
        main_grid.expand = true;
        main_grid.orientation = Gtk.Orientation.VERTICAL;
        main_grid.add (headerbar);
        main_grid.add (sidebar_label);

        add (main_grid);

        var profile = new ValaGist.MyProfile ("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");

        ValaGist.Gist[] gists = profile.list_all ();
        foreach (ValaGist.Gist gist in gists) {
            //  print ("Name: " + gist.name + "\n");
            //  print ("Description: " + gist.description + "\n");
            //  print ("Created: " + gist.created_at + "\n");

            //  foreach (ValaGist.GistFile file in gist.files) {
            //      print (file.filename + "\n");
            //      print (file.get_content()+ "\n");
            //  }
        }
    }
}