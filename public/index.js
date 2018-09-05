/* global Vue, VueRouter, axios */
// display old dates user entered
var UserShowPage = {

  template: "#user-show-page",
  data: function() {
    return {
      message: "In the history page",
      results: [],
      result: {date_completed: ""},
      result_history: [],
      date_history: []

    };
  },
  created: function() {
    console.log('in created function for user history page');
    axios.get("/api/user_pages").then(function(response) {
      console.log("the response data");
      console.log(response.data);
      this.results = response.data;
    }.bind(this));

  },
  methods: {
    hasResultParam: function(inputResult) {
      // console.log("hasResultParam running");
      // console.log(inputResult);
      var params = {
        result: inputResult.result
      };
      // console.log(params);
      if (params.result) {
        return true;
      } else {
        return false;
      }
    }
  },
  computed: {}
};

var ResultHistoryPage = {

  template: "#result-history-page",
  data: function() {
    return {
      message: "In the history page",
      results: [],
    };
  },
  created: function() {
    console.log('in created function for user history page');
    axios.get("/api/user_pages").then(function(response) {
      console.log("the response data");
      console.log(response.data);
      this.results = response.data;
    }.bind(this));

  },
  methods: {
    hasDateHistory: function(inputResult) {
      var params = {
        result: inputResult.date_history
      };
      // console.log(params);
      if (params.result === false) {
        return false;
      } else {
        return true;
      }
    },
    hasResultParam: function(inputResult) {
      // console.log("hasResultParam running");
      // console.log(inputResult);
      var params = {
        result: inputResult.result
      };
      // console.log(params);
      if (params.result) {
        return true;
      } else {
        return false;
      }
    },
    displayAllResults: function(inputResult) {
      console.log("in display results");
    }
  },
  filters: {
    moment: function(date) {
      return moment(date).format('MM/DD/YY');
    }
  },
  computed: {}
};

var SetUpPage = {
  template: "#set-up-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      results: [],
    };
  },
  created: function() {
    console.log('in created function for set up page');

    axios.get("/api/results").then(function(response) {
      console.log(response.data);
      this.results = response.data;
    }.bind(this));
  },
  methods: {
    saveToUserPage: function(inputResult) {
      console.log("I'm saving the test");
      console.log(inputResult);
      var dateCompleted = "01/01/1900";
      var params = {
        user_id: inputResult.user_ids,
        exam_id: inputResult.exam_id,
        lab_test_id: inputResult.lab_test_id,
        shot_id: inputResult.shot_id,
        vital_id: inputResult.vital_id,
        date_completed: dateCompleted
      };
      console.log('params');
      console.log(params);
      axios.post('/api/results', params).then(function(response) {
        console.log('in save response for set up page');
        console.log(response.data);
      });
    }
  },
  computed: {}
};

var NewTestPage = {
  template: "#new-test-page",
  data: function() {
    return {
      test_name: "",
      result: "",
      date_completed: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        test_name: this.test_name,
        result: this.result,
        date_completed: this.date_completed
      };
      axios
        .post("/api/user_pages", params)
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

var UserPage = {
  template: "#user-page",
  data: function() {
    return {
      message: "In the user page",
      results: [],
      result: {date_completed: ""},

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
    hasResultParam: function(inputResult) {
      // console.log("hasResultParam running");
      // console.log(inputResult);
      var params = {
        result: inputResult.result
      };
      // console.log(params);
      if (params.result) {
        return true;
      } else {
        return false;
      }
    },
    deleteTest: function(inputResult) {
      console.log("deleting the test");
      console.log(inputResult);

      var params = {
        user_id: inputResult.user_id,
        id: inputResult.id,
        vital_id: inputResult.vital_id,
        shot_id: inputResult.shot_id,
        exam_id: inputResult.exam_id,
        lab_test_id: inputResult.lab_test_id
      };
      
      console.log(params);
      axios.delete("/api/user_pages/:id", {data: params}).then(function(response) {
        console.log("in delete response");
        router.push("/user_page"); // doesn't actually refresh user page but get console logs
        console.log('rerouting page');
      });
    },
    saveResultAndDateCompleted: function(inputResult) {
      console.log("I'm saving the date/result");
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
        console.log(response.data.result);
        console.log(response.data.date_completed);
      });
    },
    resultHistory: function(inputResult) {
      console.log("in result history");
    }
  },
  computed: {}
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/#/");
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
    { path: "/user_page", component: UserPage},
    { path: "/user_page/new", component: NewTestPage},
    { path: "/user_page/:id", component: UserShowPage},
    { path: "/user_page_history", component: ResultHistoryPage},
    { path: "/set_up_page", component: SetUpPage}
    // { path: "/user_meds", component: UserMedsPage}



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