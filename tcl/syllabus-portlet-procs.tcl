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

    Procedures to support the syllabus portlet. Note that this
    portlet depends on dotlrn!

    @author arjun (arjun@openforce.net)
    @creation-date 2002-02-24
    @version $Id$

}

namespace eval syllabus_portlet {

    ad_proc -private my_package_key {
    } {
        return "dotlrn-syllabus"
    }

    ad_proc -private get_my_name {
    } {
        return "syllabus_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
	return "#dotlrn-syllabus.pretty_name#"
    }

    ad_proc -public link {
    } {
	return ""
    }

    ad_proc -public add_self_to_page {
	{-portal_id:required}
	{-package_id:required}
    } {
        Adds a syllabus portlet to the specified portal.

	@param portal_id The portal to add self to
	@return element_id The new element's id
    } {
        return [portal::add_element_parameters \
                    -portal_id $portal_id \
                    -portlet_name [get_my_name] \
                    -pretty_name [get_pretty_name] \
                    -key "package_id" \
                    -value $package_id \
                    -param_action "overwrite"
        ]
    }

    ad_proc -public remove_self_from_page {
	{-portal_id:required}
        {-package_id:required}
    } {
        Removes a syllabus portlet element from the specified page.

        @param portal_id The page to remove self from
        @param instance_id
        @param party_id The party for which to display syllabus papers
    } {
        portal::remove_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key "package_id" \
            -value $package_id
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
            -template_src "syllabus-portlet" \
            -package_key [my_package_key] \
            -config_list $cf
    }

    #
    # helper procs
    #

    ad_proc -public get_syllabus_info_list {
        {-community_id:required}
    } {
        set out_list [list]

        set community_id [dotlrn_community::get_community_id]
        set element_id [portal::get_element_ids_by_ds \
                [dotlrn_community::get_portal_id] \
                [fs_portlet::get_my_name]
        ]
        set root_folder_id \
                [portal::get_element_param [lindex $element_id 0] folder_id]
        set public_folder_id \
                [fs::get_folder -parent_id $root_folder_id -name public]
        
        lappend out_list $public_folder_id

        set rows [fs::get_folder_contents -folder_id $public_folder_id \
                -user_id [dotlrn::get_users_rel_segment_id] 
        ]
        
        # this should move to fs::
        foreach row $rows {
            if {[string equal -nocase [ns_set get $row name] syllabus]} {
                lappend out_list [ns_set get $row object_id]
                lappend out_list [ns_set get $row type]
                lappend out_list [ns_set get $row live_revision]
            }
        }

        # ns_log notice "aks11 $out_list"

        return $out_list
    }

}
