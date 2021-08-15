public class Widgets.Sidebar : Gtk.EventBox {
    construct {
        var sidebar_header = new Hdy.HeaderBar ();
        sidebar_header.decoration_layout = "close:";
        sidebar_header.has_subtitle = false;
        sidebar_header.show_close_button = true;
        // sidebar_header.get_style_context ().add_class ("sidebar-header");
        sidebar_header.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);

        // var sidebar_label = new Gtk.Label ("Sidebar");
        // sidebar_label.expand = true;

        // var action_bar = new Gtk.ActionBar ();

        var all_item = new Granite.Widgets.SourceList.Item (_("All Snippets"));
        all_item.icon = new GLib.ThemedIcon ("mail-mailbox-symbolic");

        var favorites_item = new Granite.Widgets.SourceList.Item (_("Favorites"));
        favorites_item.icon = new GLib.ThemedIcon ("help-about-symbolic");

        var favorites_category = new Granite.Widgets.SourceList.ExpandableItem ("Favorites");
        favorites_category.expand_all ();
        favorites_category.add (all_item);
        favorites_category.add (favorites_item);

        var local_item = new Granite.Widgets.SourceList.Item ("Local");
        local_item.icon = new GLib.ThemedIcon ("library-podcast-symbolic");

        var github_item = new Granite.Widgets.SourceList.Item ("Github");
        github_item.icon = new GLib.ThemedIcon ("library-music-symbolic");

        var location_category = new Granite.Widgets.SourceList.ExpandableItem (_("Location"));
        location_category.expand_all ();
        location_category.add (local_item);
        location_category.add (github_item);

        var player1_item = new Granite.Widgets.SourceList.Item ("Player 1");
        player1_item.icon = new GLib.ThemedIcon ("multimedia-player");
        player1_item.activatable = new GLib.ThemedIcon ("user-available");
        player1_item.activatable_tooltip = "Connected";

        var player2_item = new Granite.Widgets.SourceList.Item ("Player 2");
        player2_item.badge = "3";
        player2_item.icon = new GLib.ThemedIcon ("phone");

        var device_category = new Granite.Widgets.SourceList.ExpandableItem ("Devices");
        device_category.expand_all ();
        device_category.add (player1_item);
        device_category.add (player2_item);

        var source_list = new Granite.Widgets.SourceList ();
        source_list.root.add (favorites_category);
        source_list.root.add (location_category);
        // source_list.root.add (device_category);

        var grid = new Gtk.Grid ();
        grid.expand = true;
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.add (sidebar_header);
        // grid.add (sidebar_label);
        grid.add (source_list);

        add (grid);
    }
}