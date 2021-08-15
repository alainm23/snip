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

public class Services.Database : GLib.Object {
    private Sqlite.Database db;
    private string db_path;

    public signal void opened ();
    public signal void reset ();

    public void open_database () {
        int rc = 0;
        db_path = get_database_path ();

        if (create_tables () != Sqlite.OK) {
            stderr.printf ("Error creating db table: %d, %s\n", rc, db.errmsg ());
            Gtk.main_quit ();
        }

        rc = Sqlite.Database.open (db_path, out db);
        rc = db.exec ("PRAGMA foreign_keys = ON;");

        if (rc != Sqlite.OK) {
            stderr.printf ("Can't open database: %d, %s\n", rc, db.errmsg ());
            Gtk.main_quit ();
        }

        items_to_delete = new Gee.ArrayList<Objects.Item?> ();
        
        patch_database ();
        // fire signal to tell that the database is ready
        opened ();
    }


    public void patch_database () {

    }

    public string get_database_path () {
        // var database_location_use_default = Planner.settings.get_boolean ("database-location-use-default");
        // if (database_location_use_default) {
            return Environment.get_user_data_dir () + "/com.github.alainm23.snipy/database.db";
        // } else {
        //     return Planner.settings.get_string ("database-location-path");
        // }
    }

    private int create_tables () {
        int rc;
        string sql;

        rc = Sqlite.Database.open (db_path, out db);

        if (rc != Sqlite.OK) {
            stderr.printf ("Can't open database: %d, %s\n", rc, db.errmsg ());
            Gtk.main_quit ();
        }

        sql = """
            CREATE TABLE IF NOT EXISTS Users (
                id               INTEGER PRIMARY KEY,
                area_id          INTEGER,
                name             TEXT NOT NULL,
                note             TEXT,
                due_date         TEXT,
                color            INTEGER,
                is_todoist       INTEGER,
                inbox_project    INTEGER,
                team_inbox       INTEGER,
                item_order       INTEGER,
                is_deleted       INTEGER,
                is_archived      INTEGER,
                is_favorite      INTEGER,
                is_sync          INTEGER,
                shared           INTEGER,
                is_kanban        INTEGER,
                show_completed   INTEGER,
                sort_order       INTEGER,
                parent_id        INTEGER,
                collapsed        INTEGER
            );
        """;
    }
}