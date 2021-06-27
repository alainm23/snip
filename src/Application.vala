/*
* Copyright (c) 2017 Daniel Foré (http://danielfore.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
*/

public class Snip : Gtk.Application {
    public static GLib.Settings settings;

    public Snip () {
        Object (application_id: "com.github.alainm23.snip",
        flags: ApplicationFlags.FLAGS_NONE);
    }

    static construct {
        // settings = new Settings ("com.github.alainm23.snip");
    }

    protected override void activate () {
        if (get_windows ().length () > 0) {
            get_windows ().data.present ();
            return;
        }

        var app_window = new MainWindow (this);

        // var window_x = settings.get_int ("window-x");
        // var window_y = settings.get_int ("window-y");

        //  if (window_x != -1 || window_y != -1) {
        //      app_window.move (window_x, window_y);
        //  }

        app_window.show_all ();

        var quit_action = new SimpleAction ("quit", null);

        add_action (quit_action);
        set_accels_for_action ("app.quit", {"<Control>q"});

        //  var provider = new Gtk.CssProvider ();
        //  provider.load_from_resource ("com/github/danrabbit/harvey/Application.css");
        //  Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

        Gtk.Settings.get_default ().set_property ("gtk-icon-theme-name", "elementary");
        Gtk.Settings.get_default ().set_property ("gtk-theme-name", "io.elementary.stylesheet.blueberry");

        quit_action.activate.connect (() => {
            if (app_window != null) {
                app_window.destroy ();
            }
        });
    }

    public static int main (string[] args) {
        var app = new Snip ();
        return app.run (args);
    }
}
