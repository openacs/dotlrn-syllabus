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
-- Creates the syllabus paper module dotLRN applet
--
-- @author arjun (arjun@openforce.net)
-- @creation-date 2002-02-24
-- @version $Id$
--
-- Postgresql port adarsh@symphinity.com
--  
-- 11th July 2002
--

-- create the implementation
select acs_sc_impl__new (
        'dotlrn_applet',						--impl contract name
        'dotlrn_syllabus',						--impl name
        'dotlrn_syllabus'						--impl owner name
    );

-- GetPrettyName
select acs_sc_impl_alias__new (
        'dotlrn_applet',						--impl contract name 
        'dotlrn_syllabus',						--impl name
        'GetPrettyName',						--impl operation name
        'dotlrn_syllabus::get_pretty_name',		--impl alias
        'TCL'									--impl pl
    );

    -- AddApplet
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'AddApplet',
        'dotlrn_syllabus::add_applet',
        'TCL'
    );

    -- RemoveApplet
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'RemoveApplet',
        'dotlrn_syllabus::remove_applet',
        'TCL'
    );

    -- AddAppletToCommunity
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'AddAppletToCommunity',
        'dotlrn_syllabus::add_applet_to_community',
        'TCL'
    );

    -- RemoveAppletFromCommunity
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'RemoveAppletFromCommunity',
        'dotlrn_syllabus::remove_applet_from_community',
        'TCL'
    );

    -- AddUser
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'AddUser',
        'dotlrn_syllabus::add_user',
        'TCL'
    );

    -- RemoveUser
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'RemoveUser',
        'dotlrn_syllabus::remove_user',
        'TCL'
    );

    -- AddUserToCommunity
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'AddUserToCommunity',
        'dotlrn_syllabus::add_user_to_community',
        'TCL'
    );

    -- RemoveUserFromCommunity
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'RemoveUserFromCommunity',
        'dotlrn_syllabus::remove_user_from_community',
        'TCL'
);

-- AddPortlet
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'AddPortlet',
        'dotlrn_syllabus::add_portlet',
        'TCL'
);

-- RemovePortlet
select acs_sc_impl_alias__new (
     	'dotlrn_applet',
      	'dotlrn_syllabus',
       	'RemovePortlet',
        'dotlrn_syllabus::remove_portlet',
        'TCL'
);

-- Clone
select acs_sc_impl_alias__new (
	'dotlrn_applet',
	'dotlrn_syllabus',
 	'Clone',
  	'dotlrn_syllabus::clone',
   	'TCL'
);

select acs_sc_impl_alias__new (
	'dotlrn_applet',
	'dotlrn_syllabus',
 	'ChangeEventHandler',
  	'dotlrn_syllabus::change_event_handler',
   	'TCL'
);

-- Add the binding
select acs_sc_binding__new (
        'dotlrn_applet',						--contract name
        'dotlrn_syllabus'						--impl name 
);
