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

# dotlrn-syllabus/tcl/syllabus-portlet-procs.tcl

ad_library {

    Procedures to support the syllabus module portlet

    @author arjun (arjun@openforce.net)
    @creation-date 2002-02-24
    @version $Id$

}

namespace eval syllabus_admin_portlet {

    ad_proc -private my_package_key {
    } {
        return "dotlrn-syllabus"
    }

    ad_proc -private my_name {
    } {
        return "syllabus_admin_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
	return "Syllabus"
    }

    ad_proc -public link {
    } {
        return
    }

    ad_proc -public add_self_to_page {
        {-page_id ""}
	portal_id
        community_id
    } {
        Adds a syllabus portlet element to the specified page.
    } {
        return [portal::add_element_or_append_id \
            -portal_id $portal_id \
            -portlet_name [my_name] \
            -value_id $community_id \
            -key "community_id"        
        ]
    }

    ad_proc -public remove_self_from_page {
	portal_id
	instance_id
    } {
        Removes a syllabus portlet element from the specified page.
    } {
        portal::remove_element_or_remove_id \
            -portal_id $portal_id \
            -portlet_name [my_name] 
    }

    ad_proc -public make_self_available {
 	portal_id
    } {
 	Wrapper for the portal:: proc
 	
 	@param portal_id
    } {
 	portal::make_datasource_available \
            $portal_id [portal::get_datasource_id [my_name]]
    }

    ad_proc -public make_self_unavailable {
	portal_id
    } {
	Wrapper for the portal:: proc
	
	@param portal_id
    } {
	portal::make_datasource_unavailable \
            $portal_id [portal::get_datasource_id [my_name]]
    }

    ad_proc -public show {
        cf
    } {
	 Display the portal element

	 @param cf A config array as a list

	 @return HTML string
    } {
        # no return call required with the helper proc
        portal::show_proc_helper \
            -template_src "syllabus-admin-portlet" \
            -package_key [my_package_key] \
            -config_list $cf
    }

    ad_proc -public edit {
    } {
	return {}
    }

}
