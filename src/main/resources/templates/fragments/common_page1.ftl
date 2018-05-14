<#--pageNo当前的页码，totalPage总页数，totalRecord总记录数，callFunName回调方法名-->
<#--上一页,下一页,按钮定义-->
<#macro page pageNo totalPage pageSize callFunName totalRecord>
共<i class="blue" xmlns="http://www.w3.org/1999/html">${totalRecord}</i>条记录，总页数：${totalPage}  当前显示第
        <i class="blue">${pageNo}/${totalPage}</i> 页
        </div>
    </div>
    <div class="col-xs-6">
    <div class="dataTables_paginate paging_bootstrap">
    <ul class="pagination">
    <script>
        console.log(${pageNo});
    </script>
    <#if pageNo!=1>
        <li><a href="javascript:queryAll('first')">首页</a></li>
        <li><a href="javascript:queryAll('previous')">上一页</a></li>
    </#if>
    <#if pageNo!=totalPage>
        <li><a href="javascript:queryAll('next')">下一页</a></li>
        <li><a href="javascript:queryAll('last')">尾页</a></li>
    </#if>
        <li><a href="#">每页记录数:</a></li>
        <li>
            <select name="pageSize" id="pageSize" onchange="onChange()">
                <option value="10"<#if pageSize==10> selected</#if>>10</option>
                <option value="20"<#if pageSize==20> selected</#if>>20</option>
                <option value="30"<#if pageSize==30> selected</#if>>30</option>
            </select>
        </li>
        <input type="hidden" id="pageIndex" name="pageIndex" value="${pageNo}"/>
        <input type="hidden" id="totalPage" name="totalPage" value="${totalPage}"/>
        <#--回调函数-->
        <script type="text/javascript">
            function onChange() {
                debugger
                var callFunName="${callFunName}";
                var object = $("#pageSize option:selected");
                queryAll("first",object.val());
            }
        </script>
</#macro>