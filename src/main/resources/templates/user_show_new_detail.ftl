<header class="container header">
    <!-- ==== NAVBAR ==== -->
    <nav class="nav">
        <div class="logo">
            <h2>Devkit.</h2>
        </div>

        <div class="nav_menu" id="nav_menu">

            <ul class="nav_menu_list">
                <li class="nav_menu_item">
                    <a ng-click="ctrl.back()" class="nav_menu_link">category</a>
                </li>
                <li class="nav_menu_item">
                    <a ng-click="ctrl.back()" class="nav_menu_link">about</a>
                </li>
                <li class="nav_menu_item">
                    <a ng-click="ctrl.back()" class="nav_menu_link">service</a>
                </li>
                <li class="nav_menu_item">
                    <a ng-click="ctrl.back()" class="nav_menu_link">contact</a>
                </li>
            </ul>
        </div>

    </nav>
</header>

<section class="wrapper">
    <div class="container">
        <button ng-click="ctrl.back()" class="btn btn-default btn-rounded btn-sm">Back</button>
        <table class="table table-bordered" ng-if="ctrl.detail.newDetailId">
            <thead>
            <tr>
                <th>New Id</th>
                <th>Title</th>
                <th>Content</th>
                <th>Category Name</th>
                <th> Status </th>
                <th>Create At</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>{{ctrl.detail.newDetailId}}</td>
                <td>{{ctrl.detail.title}}</td>
                <td>{{ctrl.detail.content}}</td>
                <td>{{ctrl.detail.cateId}}</td>
                <td>{{ctrl.detail.status ? 'Yes' : ''}}</td>
                <td>{{ctrl.detail.createAt}}</td>
            </tr>
            </tbody>
        </table>
        <div ng-if="!ctrl.detail.newDetailId">
            <p>No details available for this category.</p>
        </div>
    </div>
</section>
