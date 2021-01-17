<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java"
        import="java.util.*,java.sql.*,tools.entity.*,tools.dao.*,tools.daoimpl.*"
        contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="jquery-3.3.1.js"></script>
    <script src="bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        .top-input {
            height: 34px;
        }
    </style>
</head>
<body>
<div id = "app">
    <label>id:</label>
    <input class="top-input" type = "text" placeholder = "请输入id" v-model = "id">
    <label>name:</label>
    <input class="top-input" type = "text" placeholder = "请输入name" v-model = "name">
    <button type = "button" class="btn btn-primary" @click = "add()">添加</button>
    <label>搜索关键字:</label>
    <input class="top-input" type = "text" placeholder = "请输入关键字" v-model = "keywords">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>日期</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="list"
        <tr>
            <td>{{item.id}}</td>
            <td>{{item.name}}</td>
            <td>{{item.ctime}}</td>
            <td><a href=" " @click.prevent = "deleteC(item.id)">删除</a></td>
            <!--加修饰符.prevent阻止a链接的默认行为-->
        </tr>
        </tbody>
    </table>
</div>
<script>
    var list =  [
        {id: 1, name: '奔驰', ctime: new Date()},
        {id: 2, name: '宝马', ctime: new Date()},
        {id: 3, name: '奥迪', ctime: new Date()},
    ]
    list.forEach()
    var vm = new Vue({
        el: "#app",
        data: {
            id: '',
            name: '',
            keywords: '',
            listTwo: [],
            list: [
                {id: 1, name: '奔驰', ctime: new Date()},
                {id: 2, name: '宝马', ctime: new Date()},
                {id: 3, name: '奥迪', ctime: new Date()},
            ]
        },
        methods: {
            add() {
                const commodities = {id: this.id, name: this.name, ctime: new Date()};
                this.list.push(commodities);
                this.id = this.name = '';
            },
            deleteC(id) {
                this.list.some((item, i) => {
                    if (item.id === id) {
                        this.list.splice(i, 1);
                        return true;
                    }
                });
            },
            search(keyword) {
                const newList = [];
                this.list.forEach((item) => {
                    if (item.name.indexOf(this.keywords) != -1) {
                        newList.push(item);
                    }
                })
                return newList;
            },
        }
    })
</script>
</body>
</html>