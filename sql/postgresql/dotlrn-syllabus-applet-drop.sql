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
-- Drops the syllabus module dotLRN applet
--
-- @author yon (yon@openforce.net)
-- @creation-date 2002-02-24
-- @version $Id$
--
-- Postgresql port adarsh@symphinity.com
--  
-- 11th July 2002
--

select acs_sc_binding__delete (
        'dotlrn_applet',					--contract_name
        'dotlrn_syllabus'					--impl_name
);

-- GetPrettyName
select acs_sc_impl_alias__delete (
	 'dotlrn_applet',					--impl_contract_name
        'dotlrn_syllabus',					--impl_name
        'GetPrettyName'						--impl_operation_name
);

-- AddApplet
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'AddApplet'
);

-- AddAppletToCommunity
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'AddAppletToCommunity'
);

-- RemoveApplet
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'RemoveApplet'
);

-- AddUser
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'AddUser'
);

-- AddUserToCommunity
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'AddUserToCommunity'
);

-- RemoveUser
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'RemoveUser'
);

-- RemoveUserFromCommunity
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_syllabus',
        'RemoveUserFromCommunity'
);

select acs_sc_impl__delete (
        'dotlrn_applet',						--impl_contract_name
        'dotlrn_syllabus'						--impl_name
);

