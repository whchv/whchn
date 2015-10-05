<%@ control language="C#" autoeventwireup="true" inherits="admin_usercontrol_Ckeditor, App_Web_ghtwk1bf" %>

<script type="text/javascript">
        CKEDITOR.replace('<%=clientId %>',
        {  
            filebrowserBrowseUrl: 'editor/ckfinder/ckfinder.html',

            filebrowserImageBrowseUrl: 'editor/ckfinder/ckfinder.html?Type=Images',

            filebrowserFlashBrowseUrl: 'editor/ckfinder/ckfinder.html?Type=Flash',

            filebrowserUploadUrl: 'editor/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',

            filebrowserImageUploadUrl: 'editor/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',

            filebrowserFlashUploadUrl: 'editor/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'
        }); 
</script>
