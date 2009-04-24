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
set community_id [dotlrn_community::get_community_id]

set title [_ dotlrn-syllabus.pretty_name]
set fs_title [syllabus_portlet::get_pretty_name]
set upload_url [export_vars -base "file-storage/file-add" {{folder_id $public_folder_id} {lock_title_p 1} {title $fs_title}}]
set link_to_url [export_vars -base "file-storage/simple-add" {{folder_id $public_folder_id} {lock_title_p 1} {title $fs_title}}]

# DRB: community_id will be blank if we're called by the portal package portal preview
# code for the generic class portlet template.

if { ![string equal $community_id ""] } {
    set syllabus_info_list [syllabus_portlet::get_syllabus_info_list -community_id $community_id]
    set public_folder_id [lindex $syllabus_info_list 0]
    set syllabus_id [lindex $syllabus_info_list 1]
    set type [lindex $syllabus_info_list 2]
}
