/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/30 01:08:42 by kefujiwa          #+#    #+#             */
/*   Updated: 2021/06/11 18:27:30 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	calc_atoi(const char *str, int sign)
{
	unsigned long	num;
	unsigned long	max;
	int				digit;

	num = 0;
	max = LLONG_MAX;
	digit = 7;
	if (sign == -1)
		digit = 8;
	while (ft_isdigit(*str))
	{
		if (num < max / 10 || (num == max / 10 && *str - '0' <= digit))
			num = num * 10 + (*str - '0');
		else
		{
			if (sign == 1)
				return (-1);
			else
				return (0);
		}
		str++;
	}
	return ((int)num * sign);
}

int	ft_atoi(const char *str)
{
	int	sign;

	sign = 1;
	while (ft_isspace(*str))
		str++;
	if (*str == '+' || *str == '-')
	{
		if (*str == '-')
			sign = -1;
		str++;
	}
	return (calc_atoi(str, sign));
}
