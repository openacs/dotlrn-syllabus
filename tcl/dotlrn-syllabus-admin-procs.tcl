#
#  Copyright (C) 2001, 2002 MIT
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

ad_library {

    Procs to set up the dotLRN syllabus module applet

    @author arjun (arjun@openforce.net)
    @version $Id$

}

namespace eval dotlrn_syllabus_admin {

    ad_proc -public applet_key {
    } {
        get the package_key this applet deals with
    } {
        return "dotlrn_syllabus_admin"
    }

    ad_proc -public package_key {
    } {
        get the package_key this applet deals with
    } {
        return "file-storage"
    }

    ad_proc portal_element_key {
    } {
        return the portal element key
    } {
        return "syllabus-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        returns the pretty name
    } {
        return "dotLRN Syllabus"
    }

    ad_proc -public add_applet {
    } {
        Used for one-time init - must be repeatable!
    } {
        dotlrn_applet::add_applet_to_dotlrn -applet_key [applet_key]
    }

    ad_proc -public remove_applet {
        community_id
        package_id
    } {
        remove the applet from dotlrn
    } {
    }

    ad_proc -public add_applet_to_community {
        community_id
    } {
        Add the syllabus applet to a specific dotlrn community
    } {
        set pt_id \
                [dotlrn_community::get_community_admin_portal_id $community_id]

        syllabus_admin_portlet::add_self_to_page $pt_id $community_id
    }

    # aks XXX FIXME - i think these procs are messed up somehow. 
    # is it just ordering? i can't tell

    ad_proc -public remove_applet_from_community {
        community_id
    } {
    } {
        set pt_id \
                [dotlrn_community::get_community_admin_portal_id $community_id]

        syllabus_admin_portlet::remove_self_to_page $pt_id $community_id
    }


    ad_proc -public add_user {
        user_id
    } {
        No user specific actions
    } {
        # noop
    }

    ad_proc -public add_user_to_community {
        community_id
        user_id
    } {
        No user specific actions
    } {
        # noop
    }

    ad_proc -public remove_user {
        user_id
    } {
        No user specific actions
    } {
    }

    ad_proc -public remove_user_from_community {
        community_id
        user_id
    } {
        No user specific actions
    } {
    }

    ad_proc -public change_event_handler {
        community_id
        event
        old_value
        new_value
    } { 
        listens for the following events: 
    } { 
    }   

}
