--
--  Copyright (C) 2001, 2002 OpenForce, Inc.
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

--
-- Creates the syllabus module portlet
--
-- @author arjun (arjun@openforce.net)
-- @version $Id$
--

declare
    ds_id portal_datasources.datasource_id%TYPE;
    foo integer;
begin
    ds_id := portal_datasource.new(
        name => 'syllabus_portlet',
        description => 'A portlet for a syllabus of a class'
    );

    --  the standard 4 params
    -- shadeable_p
    portal_datasource.set_def_param(
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'shadeable_p',
        value => 't'
    );

    -- hideable_p
    portal_datasource.set_def_param(
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'hideable_p',
        value => 't'
    );

    -- user_editable_p
    portal_datasource.set_def_param(
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'user_editable_p',
        value => 'f'
    );

    -- shaded_p
    portal_datasource.set_def_param(
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'shaded_p',
        value => 'f'
    );

    -- link_hideable_p
    portal_datasource.set_def_param(
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'link_hideable_p',
        value => 't'
    );

    -- create the implementation
    foo := acs_sc_impl.new(
        'portal_datasource',
        'syllabus_portlet',
        'syllabus_portlet'
    );

    -- add all the hooks
    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'syllabus_portlet',
        'GetMyName',
        'syllabus_portlet::get_my_name',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'syllabus_portlet',
        'GetPrettyName',
        'syllabus_portlet::get_pretty_name',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'syllabus_portlet',
        'Link',
        'syllabus_portlet::link',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'syllabus_portlet',
        'AddSelfToPage',
        'syllabus_portlet::add_self_to_page',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'syllabus_portlet',
        'Show',
        'syllabus_portlet::show',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'syllabus_portlet',
        'Edit',
        'syllabus_portlet::edit',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'syllabus_portlet',
        'RemoveSelfFromPage',
        'syllabus_portlet::remove_self_from_page',
        'TCL'
    );

    -- Add the binding
    acs_sc_binding.new(
        contract_name => 'portal_datasource',
        impl_name => 'syllabus_portlet'
    );
end;
/
show errors
