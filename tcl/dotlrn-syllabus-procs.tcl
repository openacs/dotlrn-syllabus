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

    Procs to set up the dotLRN syllabus applet

    @author arjun (arjun@openforce.net)
    @creation-date 2002-02-25
    @version $Id$

}

namespace eval dotlrn_syllabus {

    ad_proc -public applet_key {
    } {
        What's my key?
    } {
        return "dotlrn_syllabus"
    }

    ad_proc -public package_key {
    } {
        What's the key of the package I deal with?
    } {
        return "dotlrn-syllabus"
    }

    ad_proc -public get_pretty_name {
    } {
    } {
        return "#dotlrn-syllabus.pretty_name#"
    }

    ad_proc -public add_applet {
    } {
        Used for one-time init - must be repeatable!
    } {
        dotlrn_applet::add_applet_to_dotlrn \
            -applet_key [applet_key] \
            -package_key [package_key]
    }

    ad_proc -public remove_applet {
    } {
        Used for one-time destroy - must be repeatable!
    } {
        ad_return_complaint 1 "[applet_key] remove_applet not implimented!"
    }
    
    ad_proc -public add_applet_to_community {
        community_id
    } {
        Add the syllabus paper applet to a specifc dotlrn community
    } {
        # set up the admin portlet
        set admin_portal_id [dotlrn_community::get_admin_portal_id \
                                 -community_id $community_id
        ]
                
        syllabus_admin_portlet::add_self_to_page -portal_id $admin_portal_id

        # set up the syllabus portlet
        set portal_id [dotlrn_community::get_portal_id -community_id $community_id]

        set args [ns_set create]
        ns_set put $args package_id $community_id

        add_portlet_helper $portal_id $args

        return ""
    }

    ad_proc -public remove_applet_from_community {
        community_id
    } {
    } {
        ad_return_complaint 1 "[applet_key] remove_applet_from_community not implimented!"
    }

    ad_proc -public add_user {
        user_id
    } {
        No user-specifc actions
    } {
        # noop
    }

    ad_proc -public remove_user {
        user_id
    } {
        No user-specifc actions
    } {
        # noop
    }

    ad_proc -public add_user_to_community {
        community_id
        user_id
    } {
        No user-specifc actions
    } {
        # noop
    }

    ad_proc -public remove_user_from_community {
        community_id
        user_id
    } {
        No user-specifc actions
    } {
        # noop
    }

    ad_proc -public add_portlet {
        portal_id
    } {
    } {
        set args [ns_set create]
        ns_set put $args package_id 0
        set type [dotlrn::get_type_from_portal_id -portal_id $portal_id]
        
        if {![string equal $type "user"] 
            && ![string equal $type "dotlrn_community"]
            && ![string equal $type "dotlrn_club"]} {
            # Add the portlet only to class instaces
            add_portlet_helper $portal_id $args
        }  else {
            # not to any of the other types
            return
        }     
    }

    ad_proc -public add_portlet_helper {
        portal_id
        args
    } {
    } {
        syllabus_portlet::add_self_to_page \
            -portal_id $portal_id \
            -package_id [ns_set get $args "package_id"]
    }

    ad_proc -public remove_portlet {
        portal_id 
        args
    } {
        A helper proc to remove the underlying portlet from the given portal. 
        
        @param portal_id
        @param args an ns_set
    } {
        ad_return_complaint 1 "[applet_key] remove_portlet not implimented!"
    }

    ad_proc -public clone {
        old_community_id
        new_community_id
    } {
        Clone this applet's content from the old community to the new one
    } {
        ns_log notice "Cloning: [applet_key]"
        add_applet_to_community $new_community_id
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
