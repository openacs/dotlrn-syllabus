<%

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

%>

<ul>
  
  <if @syllabus_id@ not eq "">
    <if @type@ eq url>
        <li><a href="file-storage/url-goto?url_id=@syllabus_id@">Go to</a> or
        <a href="file-storage/simple-edit?object_id=@syllabus_id@">Edit</a>
       Syllabus</a>
    </if>
    <else>
      <li><a href="file-storage/file?file_id=@syllabus_id@">Go to the 
      Syllabus</a>
    </else>
  </if>
  <else>
    <li><a href="file-storage/file-add?folder_id=@public_folder_id@&title=Syllabus&lock_title_p=1">Upload</a> or <a href="file-storage/simple-add?folder_id=@public_folder_id@&title=Syllabus&lock_title_p=1">link</a> to a Syllabus
  </else>
  
</ul>
