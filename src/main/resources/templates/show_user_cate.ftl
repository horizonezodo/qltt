<header class="container header">
    <!-- ==== NAVBAR ==== -->
    <nav class="nav">
        <div class="logo">
            <h2>Devkit.</h2>
        </div>

        <div class="nav_menu" id="nav_menu">

            <ul class="nav_menu_list">
                <li class="nav_menu_item">
                    <a href="#" class="nav_menu_link">account</a>
                </li>
                <li class="nav_menu_item">
                    <a href="#" class="nav_menu_link">about</a>
                </li>
                <li class="nav_menu_item">
                    <a href="#" class="nav_menu_link">service</a>
                </li>
                <li class="nav_menu_item">
                    <a href="#" class="nav_menu_link">contact</a>
                </li>
            </ul>
        </div>

    </nav>
</header>

<section class="wrapper">
    <div class="container">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Category Id</th>
                <th>Category Name</th>
                <th>Category Status</th>
                <th> Action </th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="e in ctrl.categories">
                <td>{{e.cateId}}</td>
                <td>{{e.cateName}}</td>
                <td>{{e.cateActivate}}</td>
                <td>
                    <button type="button" ng-click="ctrl.viewDetail(e.cateId)" class="btn btn-primary custom-width">View Detail</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</section>
