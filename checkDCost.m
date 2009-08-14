function cost=checkDCost(originalRoute, newRoute);















2. 4. Evaluation of a Cost Move

A move which is a transition from one solution to another in its neighborhood may cause a change
in the objective function values measured by ? = C(S') - C(S). As the ?-interchange move involves
insertion of customers into routes, the following cost function is used to compute the cost of
inserting customer Ci into route Rk:

insertion cost of Ci = Dk + fWk +n Ok + y Tk  (3)

The insertion cost function (3) will accept infeasible solutions if the reduction in total distance is
high enough to allow either a vehicle to be overloaded or be tardy. Overloading and tardiness in a
vehicle route are penalized in the insertion cost function (3). The weight factor for total travel
time f was set to one percent of the total distance Dk. When calculating the penalty weight factors
n and y in (3), n was set to ten percent of Dk and y to one percent of Dk. The penalty values
were chosen in this manner to allow penalization relative to the total distance travelled by the
vehicle. This cost function (3) can be similarly generalized for other cases and values of ?.

D: total distance for a vehicle route k
W: total travel time (total distance+total waiting time+total service time) for a vehicle
route k
O: total overload for vehicle route k
T: total tardiness for vehicle route k
