<#setting classic_compatible=true>
<#assign base=request.contextPath />
<html>
<head></head>
<body>
<!-- START CONTENT -->
<#--web管理端注册用户-->
<section class="wrapper main-wrapper row">
    <div id="app">
        <form id="pageForm" method="get" action="/sys/login/list">
            <div class="col-lg-12">
                <section class="box ">
                    <header class="panel_header">
                        <h2 class="title pull-left">系统用户 </h2>
                        <div class="actions panel_actions pull-right">
                            <a class="box_toggle fa fa-chevron-down"></a>
                            <a class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></a>
                            <a class="box_close fa fa-times"></a>
                        </div>
                        <table style="width: 100%">
                            <tr>
                                <td align="right">
                                    <button class="layui-btn layui-btn-small" permission="sys:menu:add">
                                        <a class="layui-icon" href="/account/add">&#xe608;</a> 添加用户
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </header>
                    <div class="content-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>用户名</th>
                                        <th>登录账号</th>
                                        <th>用户昵称</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if list??>
                                        <#list page.list as item>
                                        <tr scope="row">
                                        <#--返回值类型为实体类类型，采取驼峰命名法如gmtCreate-->
                                        <#--返回值类型为PageData，采取带下划线的命名gmt_create-->
                                        <#--传过来的日期如果是字符串形式不需要转换格式，相反则转换格式-->
                                            <td>${item.username!"账号"}</td>
                                            <td>${item.nickname!"账号"}</td>
                                            <td>${item.create_time!"登录账号"}</td>
                                        </tr>
                                        </#list>
                                    <#else>
                                    <p> 抱歉!暂时无数据 </p>
                                    </#if>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    <#--分页效果-->
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="message">
                                    <ul>
                                    <#import "../fragments/common_page1.ftl" as cast/>
                                <@cast.page
                                    pageNo=page.pageNum
                                    totalPage=page.pages
                                    totalRecord=page.total
                                    pageSize=page.pageSize
                                    callFunName="/sys/getalluser"
                                    />
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>

        </form>

    </div>
</section>




</body>
</html>

