var Dashboard = React.createClass({
  render: function() {
    var dashStats = [];

    for (var i = 0; i < this.props.dash.length; i++) {
      dashStats.push(<DashStat key={i} stat={this.props.dash[i]}/>)
    }

    return(
      <div className="prep-dashboard">
        {dashStats}
      </div>
    )
  }
});
