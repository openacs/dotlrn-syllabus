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

<if @config.shaded_p@ ne "t">
  <if @syllabus_id@ not eq "">
    <if @type@ eq url>
      <a href="file-storage/url-goto?url_id=@syllabus_id@">Go to
    </if>
    <else>
      <a href="file-storage/download/index?version_id=@live_revision@">Download
    </else>
    Syllabus</a>
  </if>

  <else>
    <small>No Syllabus Found</small>
  </else>
  </if>
<else>
  &nbsp;
</else>
