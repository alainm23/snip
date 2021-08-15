/*
* Copyright © 2019 Alain M. (https://github.com/alainm23/planner)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 3 of the License, or (at your option) any later version.
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
* Authored by: Alain M. <alainmh23@gmail.com>
*/

public class Widgets.Welcome : Gtk.EventBox {
    public signal void activated (int index);

    construct {
        var headerbar = new Hdy.HeaderBar ();
        // headerbar.decoration_layout = ":maximise";
        headerbar.has_subtitle = false;
        headerbar.show_close_button = true;
        headerbar.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);

        var welcome = new Granite.Widgets.Welcome ("Snipy", _("Save your code snippets and notes"));
        welcome.margin_bottom = 48;
        welcome.append ("help-about", _("Startup"), _("Start Working Locally."));
        welcome.append ("help-about", _("Github"), _("Login"));
        welcome.get_style_context ().remove_class (Gtk.STYLE_CLASS_VIEW);

        var grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.add (headerbar);
        grid.add (welcome);

        var scrolled = new Gtk.ScrolledWindow (null, null);
        scrolled.expand = true;
        scrolled.add (grid);

        add (scrolled);

        welcome.activated.connect ((index) => {
            activated (index);
        });
    }
}
