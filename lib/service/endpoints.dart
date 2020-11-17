const apiUrl = "http://192.168.1.100:9876/api/";

/// -- User -- ///
const loginEndpoint = "${apiUrl}authentication/login";
const createUserEndpoint = "${apiUrl}authentication/create";

const getFullRecipeEndpoint = "${apiUrl}recipe/full/";
const getSimpleRecipeEndpoint = "${apiUrl}recipe/simple/";

const getFullMealEndpoint = "${apiUrl}meal/full/";
const getSimpleMealEndpoint = "${apiUrl}meal/simple/";

const getImageEndpoint = "${apiUrl}images/";

/// -- Requieres login -- ///
const changePassEndpoint = "${apiUrl}authentication/changepassword";
const currentUserEndpoint = "${apiUrl}authentication/currentuser";

const newRecipeEndpoint = "${apiUrl}recipe/new";

const newMealEndpoint = "${apiUrl}meal";
const searchEndpoint = "${apiUrl}search";
const newMenuEndpoint = "${apiUrl}menu/new";
