/* global Vue, VueRouter, axios */
var UserPage = {
  template: "#user-page",
  data: function() {
    return {
      message: "In the user page",
      results: []
    };
  },
  created: function() {
    console.log('in created function for user page');
    axios.get("/api/user_pages").then(function(response) {
      console.log(response.data);
      // var i = response.data.length / 2 - 1;
      // console.log(i);
      this.results = response.data;
    }.bind(this));
  },
  methods: {
    saveDateCompleted: function() {
      console.log('saving the date completed');
      // figure out how to send params for date_completed!
      var params = {
        date_completed: this.result.date_completed
      };

      console.log(params);

      axios.update('/api/user_page/:id', params).then(function(response) {
        console.log('in update response...');
        console.log(response.data);
      });
    }
  },
  computed: {}
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      console.log(params);
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/user_page");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      results: []
    };
  },
  created: function() {
    console.log('in created function for home page');

    axios.get("/api/results").then(function(response) {
      console.log(response.data);
      this.results = response.data;
    }.bind(this));
  },
  methods: {

  },
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/user_page", component: UserPage}

  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    console.log('jwt');
    console.log(jwt);

    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});