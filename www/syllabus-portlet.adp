<%

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

%>
<if @config.shaded_p@ ne "t">
  <if @community_id@ not eq "" and @syllabus_id@ not eq "">
    <if @type@ eq url>
      <a href="file-storage/url-goto?url_id=@syllabus_id@">#dotlrn-syllabus.Go_to#
    </if>
    <else>
      <a href="file-storage/download/@file_upload_name@?version_id=@live_revision@">#dotlrn-syllabus.Download#
    </else>
    #dotlrn-syllabus.pretty_name#</a>
  </if>
  <else>
    <small>#dotlrn-syllabus.No_Syllabus_Found#</small>
  </else>
  </if>
<else>
  &nbsp;
</else>
