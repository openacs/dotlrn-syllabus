<?xml version="1.0"?>

<queryset>
<rdbms><type>oracle</type><version>8.1.6</version></rdbms>

    <fullquery name="select_files_to_add">
        <querytext>
            select fs_files.file_id,
                   fs_files.name,
                   fs_files.live_revision,
                   fs_files.type,
                   to_char(fs_files.last_modified, 'Mon DD YYYY HH24:MI') as last_modified,
                   fs_files.content_size,
                   fs_files.url
            from fs_files,
                 acs_permissions
            where acs_permissions.object_id = fs_files.live_revision
            and acs_permissions.grantee_id = :party_id
            and acs_permissions.privilege = 'read'
            and not exists (select 1
                            from dotlrn_research_papers
                            where dotlrn_research_papers.community_id = :community_id
                            and dotlrn_research_papers.file_id = fs_files.live_revision)
            order by name
        </querytext>
    </fullquery>

    <fullquery name="select_files_to_remove">
        <querytext>
            select fs_files.file_id,
                   fs_files.name,
                   fs_files.live_revision,
                   fs_files.type,
                   to_char(fs_files.last_modified, 'Mon DD YYYY HH24:MI') as last_modified,
                   fs_files.content_size,
                   fs_files.url
            from dotlrn_research_papers,
                 fs_files
            where dotlrn_research_papers.community_id = :community_id
            and dotlrn_research_papers.file_id = fs_files.live_revision
            order by name
        </querytext>
    </fullquery>

</queryset>
