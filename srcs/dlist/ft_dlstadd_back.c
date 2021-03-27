/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_dlstadd_back.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/27 15:06:21 by kefujiwa          #+#    #+#             */
/*   Updated: 2021/03/27 15:09:20 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_dlstadd_back(t_dlist **lst, t_dlist *new)
{
	t_dlist	*tmp;

	if (!lst || !new)
		return ;
	if (*lst)
	{
		tmp = ft_dlstlast(*lst);
		tmp->next = new;
		new->prev = tmp;
	}
	else
		*lst = new;
}
