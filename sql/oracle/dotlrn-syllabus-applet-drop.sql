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
-- Drops the syllabus module dotLRN applet
--
-- @author yon (yon@openforce.net)
-- @creation-date 2002-02-24
-- @version $Id$
--

declare
    foo                         integer;
begin

    acs_sc_binding.delete (
        contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus'
    );

    -- GetPrettyName
    foo := acs_sc_impl.delete_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus',
        impl_operation_name => 'GetPrettyName'
    );

    -- AddApplet
    foo := acs_sc_impl.delete_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus',
        impl_operation_name => 'AddApplet'
    );

    -- AddAppletToCommunity
    foo := acs_sc_impl.delete_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus',
        impl_operation_name => 'AddAppletToCommunity'
    );

    -- RemoveApplet
    foo := acs_sc_impl.delete_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus',
        impl_operation_name => 'RemoveApplet'
    );

    -- AddUser
    foo := acs_sc_impl.delete_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus',
        impl_operation_name => 'AddUser'
    );

    -- AddUserToCommunity
    foo := acs_sc_impl.delete_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus',
        impl_operation_name => 'AddUserToCommunity'
    );

    -- RemoveUser
    foo := acs_sc_impl.delete_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus',
        impl_operation_name => 'RemoveUser'
    );

    -- RemoveUserFromCommunity
    foo := acs_sc_impl.delete_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus',
        impl_operation_name => 'RemoveUserFromCommunity'
    );

    acs_sc_impl.delete (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_syllabus'
    );

end;
/
show errors
