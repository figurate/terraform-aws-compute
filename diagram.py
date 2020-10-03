from diagrams import Diagram, Cluster
from diagrams.aws.compute import AutoScaling, EC2

with Diagram("AWS AutoScaling Group", show=False, direction="TB"):

    with Cluster("vpc"):

        EC2("nodes 0..n") << AutoScaling("autoscaling group") << [AutoScaling("schedule up"), AutoScaling("schedule down")]
