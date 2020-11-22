//const apiUrl = "http://192.168.1.100:9876/api/";
const apiUrl = "http://10.50.50.60:8080/api/";

/// -- User -- ///

const loginEndpoint = "${apiUrl}authentication/login";
const createUserEndpoint = "${apiUrl}authentication/create";

/// -- RESOURCE -- ///

const getImageEndpoint = "${apiUrl}resource/image/";

/// -- ENDPOINTS BELOW REQUIRES LOGIN -- ///

/// -- RECIPE -- ///

const newRecipeEndpoint = "${apiUrl}recipe/new";
const getFullRecipeEndpoint = "${apiUrl}recipe/full/";
const getSimpleRecipeEndpoint = "${apiUrl}recipe/simple/";
const getMultipleSimpleRecipeEndpoint = "${apiUrl}recipe/multiple/simple/";

/// -- MEAL -- ///

const newMealEndpoint = "${apiUrl}meal";
const updateMealEndpoint = "${apiUrl}meal";
const getFullMealEndpoint = "${apiUrl}meal/full/";
const getSimpleMealEndpoint = "${apiUrl}meal/simple/";
const getMultipleSimpleMealsEndpoint = "${apiUrl}meal/multiple/simple/";

/// -- MENU -- ///

const newMenuEndpoint = "${apiUrl}menu";
const updateMenuEndpoint = "${apiUrl}menu";
const getFullMenuEndpoint = "${apiUrl}menu/full/";
const getSimpleMenuEndpoint = "${apiUrl}menu/simple/";

/// -- USER -- ///

const currentUserEndpoint = "${apiUrl}authentication/currentuser";
const changePassEndpoint = "${apiUrl}authentication/changepassword";

/// -- SEARCH -- ///

const searchEndpoint = "${apiUrl}search";

/// -- user info -- //

const userGetCurrentMenuEndpoint = "${apiUrl}user-info/current-menu";
const userChangeCurrentMenuEndpoint = "${apiUrl}user-info/current-menu/";
const userStarItemEndpoint = "${apiUrl}user-info/star";
const userUnstarItemEndpoint = "${apiUrl}user-info/unstar";
