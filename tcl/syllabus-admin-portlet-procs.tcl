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

    Procedures to support the syllabus admin portlet. 

    @author arjun (arjun@openforce.net)
    @creation-date 2002-02-24
    @version $Id$

}

namespace eval syllabus_admin_portlet {

    ad_proc -private my_package_key {
    } {
        return "dotlrn-syllabus"
    }

    ad_proc -private get_my_name {
    } {
        return "syllabus_admin_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
	return "Syllabus Administration"
    }

    ad_proc -public add_self_to_page {
	portal_id
    } {
        Adds a syllabus admin portlet element to the specified portal
    } {
        return [portal::add_element \
                -portal_id $portal_id \
                -portlet_name [get_my_name]
        ]
    }

    ad_proc -public remove_self_from_page {
	portal_id
    } {
        Removes a syllabus admin portlet element from the specified portal
    } {
        portal::remove_element \
            -portal_id $portal_id \
            -portlet_name [get_my_name]
    }

    ad_proc -public show {
        cf
    } {
    } {
        portal::show_proc_helper \
            -template_src "syllabus-admin-portlet" \
            -package_key [my_package_key] \
            -config_list $cf
    }

}
