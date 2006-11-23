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

<ul>
  
  <if @community_id@ eq "">
    <small>No community specified</small>
  </if>
  <else>
    <if @syllabus_id@ not eq "">
      <if @type@ eq url>
        <li><a href="file-storage/url-goto?url_id=@syllabus_id@" title="#dotlrn-syllabus.Go_to# #dotlrn-syllabus.pretty_name#">#dotlrn-syllabus.Go_to#</a> #dotlrn-syllabus.or#
        <a href="file-storage/simple-edit?object_id=@syllabus_id@" title="#dotlrn-syllabus.Edit# #dotlrn-syllabus.pretty_name#">#dotlrn-syllabus.Edit#</a> #dotlrn-syllabus.pretty_name#
	</li>
      </if>
      <else>
        <li><a href="file-storage/file?file_id=@syllabus_id@" title="#dotlrn-syllabus.Go_to_the_Syllabus#">#dotlrn-syllabus.Go_to_the_Syllabus#</a></li>
      </else>
    </if>
    <else>
    <li>#dotlrn-syllabus.lt_a_hrefupload_urlUploa#</li>
    </else>
  </else>
</ul>
