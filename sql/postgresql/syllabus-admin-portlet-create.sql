--
--  Copyright (C) 2001, 2002 MIT
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
-- Postgresql port adarsh@symphinity.com
--  
-- 11th July 2002
--

create function inline_0 ()
returns integer as '
declare
  ds_id 	portal_datasources.datasource_id%TYPE;
begin
	ds_id = portal_datasource__new(
        		''syllabus_admin_portlet'',
        		''A syllabus''
	);


--  the standard 4 params
-- shadeable_p
perform portal_datasource__set_def_param(
        ds_id,								--datasource id
        ''t'',								--config required p
        ''t'',								--configured p
        ''shadeable_p'',					--key
        ''t''								--value
);

-- hideable_p
perform portal_datasource__set_def_param(
        ds_id,
        ''t'',
        ''t'',
        ''hideable_p'',
        ''t''
);

    -- user_editable_p
perform portal_datasource__set_def_param(
         ds_id,	
	''t'',
        ''t'',
        ''user_editable_p'',
        ''f''
);

    -- shaded_p
perform portal_datasource__set_def_param(
        ds_id,
        ''t'',
        ''t'',
        ''shaded_p'',
        ''f''
);

    -- link_hideable_p
perform portal_datasource__set_def_param(
        ds_id,
        ''t'',
        ''t'',
        ''link_hideable_p'',
        ''t''
);

return 0;

end; ' language 'plpgsql';

select inline_0 ();

drop function inline_0 ();

-- create the implementation
select acs_sc_impl__new(
        'portal_datasource',
        'syllabus_admin_portlet',
        'syllabus_admin_portlet'
);

-- add all the hooks
select acs_sc_impl_alias__new(
        'portal_datasource',
        'syllabus_admin_portlet',
        'GetMyName',
        'syllabus_admin_portlet::get_my_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'syllabus_admin_portlet',
        'GetPrettyName',
        'syllabus_admin_portlet::get_pretty_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'syllabus_admin_portlet',
        'Link',
        'syllabus_admin_portlet::link',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'syllabus_admin_portlet',
        'AddSelfToPage',
        'syllabus_admin_portlet::add_self_to_page',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'syllabus_admin_portlet',
        'Show',
        'syllabus_admin_portlet::show',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'syllabus_admin_portlet',
        'Edit',
        'syllabus_admin_portlet::edit',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'syllabus_admin_portlet',
        'RemoveSelfFromPage',
        'syllabus_admin_portlet::remove_self_from_page',
        'TCL'
);

    -- Add the binding
select acs_sc_binding__new(
        'portal_datasource',					--contract name
        'syllabus_admin_portlet'				--impl name
);

