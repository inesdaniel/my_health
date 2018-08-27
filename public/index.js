/* global Vue, VueRouter, axios */
// this is a nice to have, display old dates user entered
var UserShowPage = {

  props: ['date_completed'],
  template: "#user-show-page",
  data: function() {
    return {
      message: "In the user show page",
      results: [],
      result: {date_completed: ""},
      dates: []
    };
  },
  created: function() {
    console.log('in created function for user page');
    axios.get("/api/user_pages").then(function(response) {
      console.log(response.data);
      var result = response.data;
      var dates = 
      result.forEach(function(element) {
        console.log(element.date_completed);
        var dates = element.date_completed;
      });
      console.log("set dates var");
      // console.log(dates);
      this.results = response.dates;
    }.bind(this));
    console.log("set results to dates");

  },
  methods: {
    saveDateCompleted: function(inputResult) {
      console.log("I'm saving the date completed ");
      console.log(inputResult);

      var params = {
        date_completed: inputResult.date_completed,
        result: inputResult.result,
        user_id: inputResult.user_id,
        vital_id: inputResult.vital_id,
        shot_id: inputResult.shot_id,
        exam_id: inputResult.exam_id,
        lab_test_id: inputResult.lab_test_id
      };

      console.log(params);

      axios.patch('/api/user_pages/:id', params).then(function(response) {
        console.log('in update response...');
        console.log(response.data);
      });
    }
  },
  computed: {}
};

var UserPage = {
  template: "#user-page",
  data: function() {
    return {
      message: "In the user page",
      results: [],
      result: {date_completed: ""},
      old_dates_completed: []
    };
  },
  created: function() {
    console.log('in created function for user page');
    axios.get("/api/user_pages").then(function(response) {
      console.log(response.data);
      this.results = response.data;
    }.bind(this));
  },
  methods: {
    saveResult: function(inputResult) {
      console.log("I'm saving the result ");
      console.log(inputResult);
      var params = {
        date_completed: inputResult.date_completed,
        result: inputResult.result,
        user_id: inputResult.user_id,
        vital_id: inputResult.vital_id,
        shot_id: inputResult.shot_id,
        exam_id: inputResult.exam_id,
        lab_test_id: inputResult.lab_test_id
      };
      console.log(params);
      axios.patch('/api/user_pages/:id', params).then(function(response) {
        console.log('in update response for results');
        console.log(response.data);
      });

    },
    saveDateCompleted: function(inputResult) {
      console.log("I'm saving the date completed ");
      console.log(inputResult);

      var params = {
        date_completed: inputResult.date_completed,
        result: inputResult.result,
        user_id: inputResult.user_id,
        vital_id: inputResult.vital_id,
        shot_id: inputResult.shot_id,
        exam_id: inputResult.exam_id,
        lab_test_id: inputResult.lab_test_id
      };

      console.log(params);
      axios.patch('/api/user_pages/:id', params).then(function(response) {
        console.log('in update response for dates');
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
      console.log("in submit function of login");
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
          router.push("/user_page");
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
      results: [],
      // appName: "My Health"
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
    // { path: "/user_pages/:id", component: UserShowPage}


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