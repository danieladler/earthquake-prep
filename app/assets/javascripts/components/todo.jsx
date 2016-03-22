var TestDiv = React.createClass({
  render: function() {
    return(
      <div>
        <h1>Test!</h1>
        <h1>Test!</h1>
        <h1>Test!</h1>
      </div>
    );
  }
});

var ready = function () {
  ReactDOM.render(
    <TestDiv />,
    document.getElementById("todo")
  );
};

$(document).ready(ready);
