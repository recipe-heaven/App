const apiUrl = "http://192.168.1.100:9876/api/";

/// -- User -- ///
const loginEndpoint = "${apiUrl}authentication/login";
const createUserEndpoint = "${apiUrl}authentication/create";
const getRecipeEndpoint = "${apiUrl}recipe/get";

const getImageEndpoint = "${apiUrl}images/";

/// -- Requieres login -- ///
const changePassEndpoint = "${apiUrl}authentication/changepassword";
const currentUserEndpoint = "${apiUrl}authentication/currentuser";

const newRecipeEndpoint = "${apiUrl}recipe/new";

const newMealEndpoint = "${apiUrl}meal";
const searchEndpoint = "${apiUrl}search";
const newMenuEndpoint = "${apiUrl}menu/new";
