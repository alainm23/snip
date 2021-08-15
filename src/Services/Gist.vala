
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

public class Services.Gist : GLib.Object {
    private Soup.Session session;
    private const string TODOIST_SYNC_URL = "https://api.todoist.com/sync/v8/sync";

    public Gist () {
        session = new Soup.Session ();
        session.ssl_strict = false;


        //  var network_monitor = GLib.NetworkMonitor.get_default ();
        //  network_monitor.network_changed.connect (() => {
        //      var available = GLib.NetworkMonitor.get_default ().network_available;

        //      if (available) {
        //          if (Planner.settings.get_boolean ("todoist-account") &&
        //              Planner.settings.get_boolean ("todoist-sync-server")) {
        //              sync.begin ();
        //          }
        //      }
        //  });

        //  Planner.database.reset.connect (() => {
        //      if (this.server_timeout != 0) {
        //          Source.remove (this.server_timeout);
        //          this.server_timeout = 0;
        //      }
        //  });
    }

    public async void get_access_token (string redirect_uri) {
        string code = redirect_uri.split ("=") [1];

        string URL = "%s?client_id=%s&client_secret=%s&code=%s"
        .printf (
            "https://github.com/login/oauth/access_token",
            "1ffcddc8c38125106f2d",
            "5399ce81eda2b38bc7b1db982d0bf461634de02f",
            code
        );

        print ("CODE: %s\n".printf (code));
        print ("URL: %s\n".printf (URL));

        var message = new Soup.Message ("POST", URL);
        message.request_headers.append ("Accept", "application/json");

        session.send_message (message);

        try {
            var parser = new Json.Parser ();
            parser.load_from_data ((string) message.response_body.flatten ().data, -1);
            print ("%s\n".printf ((string) message.response_body.flatten ().data));
        } catch (Error e) {

        }
    }
}