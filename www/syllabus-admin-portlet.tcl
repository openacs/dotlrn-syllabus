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

# dotlrn-syllabus/www/syllabus-admin-portlet.tcl

ad_page_contract {
    The display logic for the syllabus admin portlet

    @author arjun (arjun@openforce.net)
    @version $Id$
} -properties {
    syllabus_id:onevalue
    type:onevalue
    public_folder_id:onevalue
}

set syllabus_info_list [syllabus_portlet::get_syllabus_info_list \
        -community_id [dotlrn_community::get_community_id]
]
set public_folder_id [lindex $syllabus_info_list 0]
set syllabus_id [lindex $syllabus_info_list 1]
set type [lindex $syllabus_info_list 2]
    

