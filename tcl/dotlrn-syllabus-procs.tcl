#
#  Copyright (C) 2001, 2002 OpenForce, Inc.
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

    Procs to set up the dotLRN syllabus applet

    @author arjun (arjun@openforce.net)
    @creation-date 2002-02-25
    @version $Id$

}

namespace eval dotlrn_syllabus {

    ad_proc -public applet_key {
    } {
        get the package_key this applet deals with
    } {
        return "dotlrn_syllabus"
    }

    ad_proc -public package_key {
    } {
        get the package_key this applet deals with
    } {
        return "dotlrn-syllabus"
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
    } {
        Used for one-time destroy - must be repeatable!
    } {
    }

    ad_proc -public add_applet_to_community {
        community_id
    } {
        Add the syllabus paper applet to a specifc dotlrn community
    } {
        set pt_id [dotlrn_community::get_portal_template_id $community_id]

        syllabus_portlet::make_self_available $pt_id

        if {[dotlrn_community::dummy_comm_p -community_id $community_id]} {
            syllabus_portlet::add_self_to_page $pt_id $community_id
            return
        }

        syllabus_portlet::add_self_to_page $pt_id $community_id

        dotlrn_syllabus_admin::add_applet_to_community $community_id
    }

    ad_proc -public remove_applet_from_community {
        community_id
    } {
    } {
    }

    ad_proc -public add_user {
        user_id
    } {
        No user-specifc actions
    } {
    }

    ad_proc -public remove_user {
        user_id
    } {
        No user-specifc actions
    } {
    }

    ad_proc -public add_user_to_community {
        community_id
        user_id
    } {
        No user-specifc actions
    } {
    }

    ad_proc -public remove_user_from_community {
        community_id
        user_id
    } {
        No user-specifc actions
    } {
    }

}
